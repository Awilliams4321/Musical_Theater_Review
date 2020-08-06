module ApplicationHelper

    def is_logged_in?
        unless session.has_key?(:user_id)
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path 
        end
      end
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if is_logged_in?
      end
    
    
end
