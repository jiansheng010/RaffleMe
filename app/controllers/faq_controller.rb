#
# Routes used in displaying the FAQ and License page
#
# 4/15/2019 - Filled out method routes for faq/gnu controller - JS Teoh
#
class FaqController < ApplicationController

  #
  # Handles the post request generated when clicked the FAQ link
  #
  # 4/15/2019 - Created Method - JS Teoh
  #
  def faq_display
    @questions_and_answers = Faq.all
  end

  #
  # Handles the post request generated when clicking the License link
  #
  # 4/15/2019 - Created Method - JS Teoh
  #
  def gnu_display
  end

  #
  # Handles the post request generated when clicking the © 2019 Have Tests? Maybe Later link
  #
  # 4/15/2019 - Created Method - JS Teoh
  #
  def team_display
  end
end
