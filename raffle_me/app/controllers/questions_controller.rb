class QuestionsController < ApplicationController

  #
  # Gets a list of the user's questions
  #
  # 04/16/2019 - Created Method - Austin Pearce
  #
  def index
    @user_questions = Question.where user_email: current_user.email
  end

  #
  # Prompt user to create a new question
  #
  # 04/16/2019 - Created Method - Austin Pearce
  #
  def new
    @question = Question.new
    @question.prompt = params[:prompt]
    @question.correct_answer = params[:correct_answer]
    @question.wrong_answer_1 = params[:wrong_answer_1]
    @question.wrong_answer_2 = params[:wrong_answer_2]
    @question.wrong_answer_3 = params[:wrong_answer_3]
    @question.user_email = current_user.email
    @question.save
    redirect_to '/questions'
  end

  #
  # Destroys a user question
  #
  # 04/16/2019 - Created Method - Austin Pearce
  #
  def delete
    question = Question.find_by(id: params[:question_id])
    question.destroy
    redirect_to '/questions'
  end
end
