class DashboardController < ApplicationController

  def index
    @articles = current_user.articles.recent
    @articles_today = current_user.articles.today.recent
    @total_views_today = current_user.article_views_total_today
    @unique_views_today = current_user.article_views_unique_today
  end

end