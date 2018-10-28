class Admin::UserManagementController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def edit
  end
end
