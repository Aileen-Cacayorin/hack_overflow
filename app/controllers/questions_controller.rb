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

  private

  def set_default
    @questions = Question.all
    @question = Question.find(param[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :tag_ids =>[])
  end

end
