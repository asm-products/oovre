class Admin::AdminController < ApplicationController

  def index
    @users = User.all
  end

end
