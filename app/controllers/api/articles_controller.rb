class Api::ArticlesController < ApplicationController
  respond_to :json
  before_action :get_article, only: [:basic_stats]

  def basic_stats
    unique_visits = @article.visit.unique_visits rescue 0
    total_visits = @article.visit.total_visits rescue 0

    render :json => {
      info: @article,
      user: @article.user,
      unique_visits: unique_visits,
      total_visits: total_visits
    }
  end

  private

    def get_article
      @article = Article.find(params[:id])
    end

end
