class MainController < ApplicationController
  def index
    
    @apifeed = FeedService.get_feed('all', 'bbc-news', 'bbc.co.uk', 10)    
    @bizfeed = FeedService.get_feed('business', 'bbc-news', 'bbc.co.uk', 10)
    @spofeed = FeedService.get_feed('sports', 'bbc-news', 'bbc.co.uk', 10)

    @top_article = @apifeed.first
  end
  
end
