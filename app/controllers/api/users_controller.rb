class Api::UsersController < ApplicationController
  respond_to :json

  def follower_count
    user = User.find(params[:user_id])
    if user.present?
      count = user.followers.count
      message = {follower_count: count}
      status = :ok
    else
      message = "couldn't fetch followers for this user."
      status = :unprocessible_entity
    end
    render_json(message, status)
  end

  def follow
    message = current_user.follow!(params[:user_id])
    render_json(message, :ok)
  end

  def unfollow
    message = current_user.unfollow!(params[:user_id])
    render_json(message, :ok)
  end

  def render_json(message=nil, status)
    render :json => { message: message, status: status }
  end

end
