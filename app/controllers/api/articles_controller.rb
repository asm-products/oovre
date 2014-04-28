class ArticlesController < ApplicationController

  def basic_stats
    render :json => {
      # some very basic stats for an article
    }
  end

end