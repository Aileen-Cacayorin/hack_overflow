class TagsController < ApplicationController
  def new
  end

  def create
  end

  def show

  end


  private

  def set_default
    @tags = Tag.all
    @tag = Tag.find(params[:id])
  end

end
