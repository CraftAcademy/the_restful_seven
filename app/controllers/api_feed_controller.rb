class ApiFeedController < ApplicationController

  def index
    @apifeed = FeedService.get_feed('politics', 'bbc-news', 'bbc.co.uk', 10)
    @top_article = @apifeed.first
  end
end