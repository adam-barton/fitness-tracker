module ApplicationHelper
    def current_user_path
        if session[:user_id]
          user_path(session[:user_id])
        else
          signin_path
        end
      end
end
