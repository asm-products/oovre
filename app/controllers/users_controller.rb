class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    respond_to do |format|
      format.html { Visit.track(@user, request.remote_ip) }   # show.html
      format.json { render json: @user, status: :ok }
    end
  end

  def home
    @articles = Article.recent.today.take(20)
    @trending = Article.trending_with_total.take(5)
  end

end