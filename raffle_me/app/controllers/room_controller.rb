#
# Routes used in joining and managing raffle rooms
#
# 4/8/2019 - Filled out method routes for room controller - Tom Paoloni
# 4/16/2019 - Simplified - Tom Paoloni
# 4/16/2019 - Created/completed methods for deleting entrant - Brandon Arbuthnot
#
class RoomController < ApplicationController
  # Name of a room
  attr_accessor :room_name

  # Entrants list taken from entrants table in the DB
  attr_accessor :entrants

  # Room code - used for joining and keeping track of rooms
  attr_accessor :room_code

  # Name of an entrant that is joining the raffle
  attr_accessor :username

  #
  # Called when a user leaves the room early
  #
  # 4/16/19 - Method created - Brandon Arbuthnot
  #
  def delete_entrant
    entrant = Entrant.find_by(username: params[:username], room_code: params[:room_code])
    entrant&.destroy
    redirect_to '/'
  end

  #
  # Handles the post request generated when creating a room
  #
  # 4/8/2019 - Created Method - Tom Paoloni
  #
  def manage_post
    cookies[:manages] = { value: [], expires: Time.now + 3600 } if cookies[:manages].nil?
    @room_name = params[:room_name]
    @random_winner = params[:random_winner] == 'true' ? true : false
    @room_code = [*('A'..'Z'), *('0'..'9')].sample(4).join
    cookies[:manages] = { value: cookies[:manages] << ',' + @room_code, expires: Time.now + 3600 }
    redirect_to '/manage/' + @room_code, flash: { room_name: @room_name, random_winner: @random_winner }
  end

  #
  # Handles the get request generated when creating a room and when refreshing an existing room page
  #
  # 4/8/2019 - Created Method - Tom Paoloni
  # 4/17/2019 - Added call to shuffle_questions - JS Teoh
  #
  def manage
    @room_code = params[:id]
    room = Room.find_by(room_code: @room_code)
    if !room.nil?
      @room_name = room[:room_name]
    elsif !flash[:room_name].nil?
      @room_name = flash[:room_name]
      @random_winner = flash[:random_winner]

      room_params = {
        room_code: @room_code,
        room_name: @room_name,
        owner: current_user&.email,
        random_winner: @random_winner
      }
      room = Room.new(room_params)
      room.save
    end

    if room&.owner.nil? && (cookies[:manages].nil? || !cookies[:manages].split(',').include?(@room_code))
      redirect_to '/'
    elsif room&.owner != current_user&.email
      redirect_to '/'
    end

    @entrants = Entrant.where(room_code: @room_code)
    shuffle_questions(@room_code)
  end

  def delete_user_room
    room = Room.find_by(room_code: params[:room_code])
    room.destroy
    redirect_to '/'
  end

  #
  # Handles the get request generated when joining a room
  #
  # 4/8/2019 - Created Method - Tom Paoloni
  #
  def play
    @room_code = params[:room_code]

    room = Room.find_by(room_code: @room_code)
    @room_name = room&.room_name
    @username = params[:username]

    redirect_to '/', flash: { join_code_error: true } if room.nil?
  end
  #
  # Shuffles the order of the questions when the manager presses play
  #
  # 4/16/2019 - Created Method - JS Teoh
  #
  def shuffle_questions(room_code)
    @email = current_user&.email
    questions = Question.where(user_email: @email)
    questionIds = questions.map { |question| question.id }
    questionIds.shuffle!

    room = Room.find_by(room_code: room_code)
    room.order = questionIds.join(",")
    room.save
  end
end
