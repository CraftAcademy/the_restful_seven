class PremiumListingsController < ApplicationController
  def index
    @premium = Article.all
    # @premium_articles (should be plural)
  end

  def show
    @premium = Article.find(params[:id])
  end
end
