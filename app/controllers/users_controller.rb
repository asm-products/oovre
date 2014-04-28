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
    @articles = Article.recent.take(20)
    if Article.today.trending_with_total.empty?
      @trending = Article.recent.trending_with_unique.take(5)
    else
      @trending = Article.today.trending_with_unique.take(5)
    end
  end

end