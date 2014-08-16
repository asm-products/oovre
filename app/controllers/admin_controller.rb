class AdminController < ApplicationController

  layout 'admin'

  def index
    @recent_users = User.recent.today.take(20)
    @recent_articles = Article.recent.today.take(20)
  end

  def users
  	@users = User.take(50)
  end

  def articles
  	@articles = Article.take(50)
  end

  def site_settings
  end

end
