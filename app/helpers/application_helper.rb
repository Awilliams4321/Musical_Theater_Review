module ApplicationHelper

    def is_logged_in?
        session.has_key?(:user_id)
    end 

    def current_user
      @current_user ||= User.find(session[:user_id]) if is_logged_in?
    end
    
end
