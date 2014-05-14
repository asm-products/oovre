class ArticlesController < ApplicationController

  before_action :get_article, only: [:update, :edit, :destroy]

  def new
  end

  def edit
  end

  def show
    @article = Article.find(params[:id])
    Visit.track(@article, request)
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save()
      respond_to do |f|
        f.json {
          render :json => { status: :created, message: "Successfully created article.", article: @article, location: article_show_path(@article) }
        }
      end
    else
      respond_to do |f|
        f.json {
          render :json => { status: :unprocessible_entity, message: "Oops... something went wrong, please try again." }
        }
      end
    end
  end

  def update
    if @article.update_attributes(article_params)
      respond_to do |f|
        f.json { render :json => { status: :ok, message: "Successfully updated article!" } }
      end
    else
      respond_to do |f|
        f.json { render :json => { status: :ok, message: "Oops... Something went wrong, we're working on it." } }
      end
    end
  end

  def destroy
    if @article.can_delete?(current_user)
      @article.destroy
      redirect_to user_home_path, notice: "Deleted this article."
    else
      redirect_to @articled, notice: "You cannot delete this article."
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
