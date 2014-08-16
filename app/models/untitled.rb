class User < ActiveRecord::Base

  # Scopes...
  scope :joined_today, -> {
    where("users.created_at >= ? and users.created_at <= ?", 
      Date.today.beginning_of_day, Date.today.end_of_day)
  }

  def is_following?
  end

end