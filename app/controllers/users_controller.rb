class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    respond_to do |format|
      format.html { 
        if @user != current_user 
          Visit.track(@user, request) 
        end 
      }   # show.html
      format.json { render json: @user, status: :ok }
    end
  end

  def home
    @recommended_articles = Article.recent.take(3)

    @following_articles_users = []
    @following_articles = []
    following = current_user.followed_users.all
    following.each do |user|
      @following_articles_users.push(user.username)
      @following_articles.push(user.articles.recent.take(1))
    end
  end
  
end