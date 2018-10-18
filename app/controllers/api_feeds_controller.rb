require 'articles_service'

class ApiFeedsController < ApplicationController
  def index
    @apifeeds = FeedsService.get_feed('all', 'bbc-news', 'bbc.co.uk')
  end
end