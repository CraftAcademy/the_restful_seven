class PremiumListingsController < ApplicationController
  def index
    @premium = Article.all
  end

  def show
    @premium = Article.find(params[:id])
  end
end
