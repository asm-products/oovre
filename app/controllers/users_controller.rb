class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    respond_to do |format|
      format.html { Visit.track(@user, request.remote_ip) }   # show.html
      format.json { render json: @user, status: :ok }
    end
  end

  def home
    @articles = Article.recent.take(20)
    if Article.today.trending_with_total.empty?
      @trending = Article.recent.trending_with_total.take(5)
    else
      @trending = Article.today.trending_with_total.take(5)
    end
  end

end