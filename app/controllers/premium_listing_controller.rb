class PremiumListingController < ApplicationController
  def index
    @premium = Article.all
  end
end
