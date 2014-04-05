class Api::UsersController < ApplicationController
  respond_to :json

  def follow_status
    following = current_user.following?(params[:user_id])
    message = following != nil ? true : false
    render :json => { :status => 'ok', :follow_status => message }
  end

  def follow
    message = current_user.follow!(params[:user_id])
    render :json => { :status => 'ok', :message => message }
  end

  def unfollow
    message = current_user.unfollow!(params[:user_id])
    render :json => { :status => 'ok', :message => message }
  end

end
