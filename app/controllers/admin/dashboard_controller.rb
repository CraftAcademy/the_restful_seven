class Admin::DashboardController < ApplicationController
  def index
    @articles = Article.all
  end
end
