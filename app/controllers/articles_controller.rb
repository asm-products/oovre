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
    Visit.track(@article, request)
    @more_from = Article.where(user: @article.user).recent.take(3)
    @similar = @article.similar(5)
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save()
      status = :created
      message = "Article created successfully!"
    else
      status = :unprocessible_entity
      message = "Could not create article. Missing some required fields?"
    end

    respond_to do |format|
      format.json { render :json => { 
        status: status, 
        message: message,
        update_location: update_article_path(@article),
        article: @article } 
      }
    end
  end

  def update
    if @article.update_attributes(article_params)
      respond_to do |format|
        format.html
        format.json {  }
      end
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
      params.require(:article).permit(:title, :subtitle, :content, :image, :article_set_id, :status)
    end

end