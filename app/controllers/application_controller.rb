class ApplicationController < ActionController::Base

    private

    def authorized_to_access_dashboard? 
      if current_user
        (current_user.author? || current_user.editor?) ? true : false
      end 
    end
end
