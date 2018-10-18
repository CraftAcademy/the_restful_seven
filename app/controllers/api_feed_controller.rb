class ApiFeedController < ApplicationController

  def index
    @apifeed = FeedService.get_feed('tech', 'bbc-news', 'bbc.co.uk', 10)
    @top_article = FeedService.get_feed('tech', 'bbc-news', 'bbc.co.uk', 1)
  end

end