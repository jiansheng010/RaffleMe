
#
# Controller used for displaying results at the end of a raffle
#
# 04/17/2019 - Created Controller and View - Austin Pearce
#
class ResultsController < ApplicationController
  #
  # Default view
  #
  def index
    @room = Room.find_by(room_code: params[:id])
    @result = Entrant.where(room_code: params[:id]).order(:points)
    if @room&.random_winner && @room&.winner_id == nil
      # Pick a random winner
      @total = @result.inject(0) { |total, x| x.points + total }
      @rand = rand(@total + 1)
      @result.each do |entrant|
        if entrant.points >= @rand
          @winner = entrant
          @room&.winner_id = entrant.id
          @room&.save
          break
        else
          @rand -= entrant.points
        end
      end
    elsif @room&.winner_id != nil
      @winner = Entrant.find_by(id: @room.winner_id)
    else
      @results = @result.reverse
    end
  end
end
