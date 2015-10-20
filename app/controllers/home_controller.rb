class HomeController < ApplicationController
  def index
    @tags = Tag.all
    @questions = Question.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end
end
