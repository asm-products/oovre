class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = current_user.articles.new
  end

  def edit
    if current_user != @article.user
      redirect_to user_home_path, notice: "You can't edit this article."
    end
  end

  def show
    Visit.track(@article, request.remote_ip)
    @similar = @article.similar(5)
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save()
      redirect_to article_path(@article), notice: "Created article!"
    else
      redirect_to new_article_path(@article), notice: "Could not save article."
    end
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    end
  end

  def destroy
    if current_user == @article.user
      @article.destroy
      redirect_to user_home_path, notice: "Successfully deleted this article."
    end
  end

  def get_article
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :subtitle, :content, :image)
    end

end