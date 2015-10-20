class AnswersController < ApplicationController
  before_action :authorize, only: [:edit, :new, :create, :destroy]
  before_action :set_default, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if params[:vote] == 'up'
      @answer.upvote
      @answer.save
      redirect_to question_path(@question)
    else params[:vote] == 'down'
      @answer.downvote
      @answer.save
      redirect_to question_path(@question)
    end

  end

  private

  def set_default
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:response)
  end

end
