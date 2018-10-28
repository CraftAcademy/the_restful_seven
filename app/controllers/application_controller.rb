class ApplicationController < ActionController::Base

  private

  def authorized_to_access_dashboard?
    if current_user
      if (current_user.author? || current_user.editor?)
        true
      else
        redirect_to root_path, notice: "You are not authorized to enter"
      end
    else
      redirect_to root_path, notice: "You are not authorized to enter"
    end
  end
  
  def editor?
    if current_user
      if (current_user.editor?)
        true
      else
        redirect_to root_path, notice: "You are not authorized to enter"
      end
    else
      redirect_to root_path, notice: "You are not authorized to enter"
    end    
  end


  
end