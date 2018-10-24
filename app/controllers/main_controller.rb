class MainController < ApplicationController

  def index
    @allfeed = FeedService.get_feed('all', 'bbc-news', 'bbc.co.uk', 10) 
    
    if params[:category]
      @category_selected = params[:category]
      @category_news = FeedService.get_feed(params[:category], 'bbc-news', 'bbc.co.uk', 10) 
    else
      @category_selected = "all"
      @category_news = @allfeed
    end

    @top_article = @allfeed.first
  end
  
end