class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: session_params[:email])
        
        if user && user.authenticate(session_params[:password])
            session[:user_id] = user.id
            redirect_to musicals_path
        else
            redirect_to login_path
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def github

    end

    private
    
    def session_params
        params.require(:session).permit(:username, :email, :password)
    end


end