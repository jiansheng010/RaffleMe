#
# Routes used when a raffle has started
#
# 4/15/2019 - Filled out method routes for rafffle started controller - JS Teoh
# 4/17/2019 - Added raffle_before_results method controller - JS Teoh
#
class RaffleStartedController < ApplicationController

  #
  # Handles the post request generated when a raffle has started
  # Issues questions
  #
  # 4/15/2019 - Created Method - JS Teoh
  # 4/17/2019 - Modified Method - JS Teoh
  #
  def raffle_started
    @roomcode = params[:roomcode]
    @username = params[:username]

    if !params[:id].nil?
      @id = params[:id].to_i
    elsif !flash[:id].nil?
      @id = flash[:id].to_i
    else
      @id = 1
    end

    current_id = Room.find_by(room_code: @roomcode)
    questions = current_id.order.split(",")[@id-1]
    @currentQuestion = Question.find_by(id: questions.to_i)

    if @currentQuestion.nil?
      redirect_to "/raffle_before_results/#{@roomcode}"
    else
      @answers = []
      @answers << @currentQuestion.correct_answer
      @answers << @currentQuestion.wrong_answer_1
      @answers << @currentQuestion.wrong_answer_2
      @answers << @currentQuestion.wrong_answer_3
      @answers.shuffle!
    end
  end

  #
  # Handles the post request generated when a raffle has end and is waiting for
  # the result screen
  #
  # 4/17/2019 - Created Method - JS Teoh
  #
  def raffle_before_results
    @room_code = params[:roomcode]
  end

  #
  # Handles the post request generated when a user has selected a correct answer
  #
  # 4/16/2019 - Created Method - JS Teoh
  # 4/17/2019 - Modified Method - JS Teoh
  #
  def addPointsToEntrant
    @id = params[:id].to_i
    @answer = params[:answer]
    @username = params[:username]
    @room_code = params[:roomcode]
    add_point = Entrant.find_by(username: @username, room_code: @room_code )
    check_question = Question.find_by(id: @id - 1)
    add_point.points += 1 if check_question.correct_answer == @answer
    add_point.save

    redirect_to "/raffle_started/#{@room_code}/#{@username}" , flash: { id: @id }
  end
end
