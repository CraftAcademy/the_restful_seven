class Admin::DashboardController < ApplicationController
  def index
    if authorized_to_access_dashboard?
      @articles = Article.all
    else
      redirect_to root_path, notice: 'You are not authorized to enter'
    end
  end

end
