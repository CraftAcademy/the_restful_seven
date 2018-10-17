class ApiFeedsController < ApplicationController
  def index
    @ApiFeeds = FeedService.get_feed('business', 'bbc-news', 'bbc.co.uk')
  end
end
