class MainController < ApplicationController

  def index
    if params[:category]
      @category_selected = params[:category]
      @category_news = FeedService.get_feed(params[:category].downcase, 'bbc-news', 'bbc.co.uk', 10) 
      render :categories_feed
    else
      @category_selected = "All"
      @category_news = FeedService.get_feed('all', 'bbc-news', 'bbc.co.uk', 10) 
      @top_article = @category_news.first
    end
  end
end