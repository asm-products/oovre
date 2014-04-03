class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    Visit.track(@user, request.remote_ip)

    puts @user.inspect
    puts "\n"
    puts current_user.inspect
  end

  def home
  end

end
