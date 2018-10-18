require 'articles_service'

class ApiFeedsController < ApplicationController
  def index
    @apifeeds = FeedsService.get_feed('business', 'bbc-news', 'bbc.co.uk')
  end
end