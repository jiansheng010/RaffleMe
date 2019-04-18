#
# Controller and views used for the default landing pages
#
# 04/15/2019 - Created Controller and Views - Tom Paoloni
#
class LandingController < ApplicationController
  
  #
  # Controller for the initial landing page. No 
  # logic required
  #
  def index
  end

  #
  # Controller for the user dashboard page.
  # Loads up that user's rooms
  #
  def dashboard
    @my_rooms = Room.where(owner: current_user.email)
  end
end
