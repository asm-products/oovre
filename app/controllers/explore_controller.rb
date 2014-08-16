class ExploreController < ApplicationController

  def index
  end

  def me
    @stats = current_user.getstats
    @articles = current_user.articles.all
  end

end