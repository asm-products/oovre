class ArticlesController < ApplicationController

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(create_params)
    redirect_to article_path(@article) if @article.save()
  end

  def show
    @article = get_article(params[:id])
    @similar = @article.similar(5)
  end

  private

  def get_article(article_id)
    Article.find(article_id)
  end

  def create_params
    params.require(:article).permit(:title, :subtitle, :content, :image)
  end

end
