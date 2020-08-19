module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    if !session.include? :user_id
      redirect_to root_path, danger: "You must be logged in to do that!"
    end 
  end

  

end
  
    
    
