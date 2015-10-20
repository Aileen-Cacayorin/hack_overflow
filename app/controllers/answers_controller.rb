class AnswersController < ApplicationController
  before_action :authorize, only: [:edit, :new, :create, :destroy]

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:success] = "Your answer has been added"
      redirect_to :back
    else
      flash[:danger] = "Oops, something went wrong, please try again."
      redirect_to :back
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:response)
  end

end
