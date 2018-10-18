class ApiFeedController < ApplicationController
  def index
    @apifeed = FeedService.get_feed('tech', 'bbc-news', 'bbc.co.uk')
  end
end