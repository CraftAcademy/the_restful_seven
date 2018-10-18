class ApiFeedController < ApplicationController

  def index
    @apifeed = FeedService.get_feed('tech', 'bbc-news', 'bbc.co.uk')
    @top_article = FeedService.top_news('tech', 'bbc-news', 'bbc.co.uk')
  end

end