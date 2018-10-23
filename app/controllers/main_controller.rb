class MainController < ApplicationController
  def index
    
    @allfeed = FeedService.get_feed('all', 'bbc-news', 'bbc.co.uk', 10)    
    @generalfeed = FeedService.get_feed('general', 'bbc-news', 'bbc.co.uk', 10)    
    @businessfeed = FeedService.get_feed('business', 'bbc-news', 'bbc.co.uk', 10)    
    @sportsfeed = FeedService.get_feed('sports', 'bbc-news', 'bbc.co.uk', 10)    
    @entertainmentfeed = FeedService.get_feed('entertainment', 'bbc-news', 'bbc.co.uk', 10)    
    @healthfeed = FeedService.get_feed('health', 'bbc-news', 'bbc.co.uk', 10)
    @technologyfeed = FeedService.get_feed('technology', 'bbc-news', 'bbc.co.uk', 10)

    @top_article = @apifeed.first
  end
  
end
