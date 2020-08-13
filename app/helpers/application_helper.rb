module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    if !session.include? :user_id
      flash[:errors] = "You must be logged in to do that!"
      redirect_to root_path
    end 
  end

end
  
    
    
