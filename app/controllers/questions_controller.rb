class QuestionsController < ApplicationController
  before_action :authorize, only: [:edit, :new, :create, :destroy]
  before_action :set_default, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def new
    @question = Question.new

  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = "Your question was added"
      redirect_to root_path
    else
      flash[:danger] = "Oops, something went wrong and your question wasn't added."
      render :new
    end
  end

  def show
    @user = @question.user
    @answers = @question.answers
    @answer = Answer.new
  end

  def edit

  end

  def update
    if params[:vote] == 'up'
      @question.upvote
      @question.save
      redirect_to question_path(@question)
    elsif params[:vote] == 'down'
      @question.downvote
      @question.save
      redirect_to question_path(@question)
    elsif @question.update(question_params)
      flash[:success] = "Question change saved"
      redirect_to question_path(@question)
    else
      flash[:danger] = "Something went wrong and the changes were not saved."
      redirect_to :back
    end
  end

  def destroy
    if @question.answers.any?
      @question.answers.each do |answer|
        answer.destroy

      end
      @question.destroy
      flash[:success] = "Question deleted"
      redirect_to root_path
    elsif @question.destroy
      flash[:success] = "Question deleted"
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong and the question was not deleted"
      redirect_to :back
    end
  end


  private

  def set_default
    @questions = Question.all
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :tag_ids =>[])
  end

end
