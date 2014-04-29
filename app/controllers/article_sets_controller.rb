class ArticleSetsController < ApplicationController

  def new
    @article_set = current_user.article_sets.new
  end

  def show
    @article_set = ArticleSet.find(params[:id])
    @articles = @article_set.articles
  end

  def create
    @article_set = current_user.article_sets.new(set_params)
    @article_set.save
    redirect_to @article_set
  end

  private

  def set_params
    params.require(:article_set).permit(:name, :description)
  end

end
