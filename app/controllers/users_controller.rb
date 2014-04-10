class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    Visit.track(@user, request.remote_ip)
  end

  def home
    @articles = Article.today.take(20)
  end

end