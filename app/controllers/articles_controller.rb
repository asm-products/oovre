class ArticlesController < ApplicationController

  def new
    @article = current_user.articles.new
  end

  def edit
    @article = get_article(params[:id])
  end

  def create
    @article = current_user.articles.new(article_params)
    redirect_to article_path(@article) if @article.save()
  end

  def update
    @article = get_article(params[:id])
    redirect_to article_path(@article) if @article.update_attributes(article_params)
  end

  def show
    @article = get_article(params[:id])
    @similar = @article.similar(5)
  end

  def destroy
    @article = get_article(params[:id])
  end

  private

  def get_article(article_id)
    Article.find(article_id)
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :image)
  end

end
