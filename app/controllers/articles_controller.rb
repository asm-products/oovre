class ArticlesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @article = Article.find(params[:id])
  end

end