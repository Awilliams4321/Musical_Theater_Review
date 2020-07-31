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
        
        # user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        #   end
       
        #   session[:user_id] = user.id
       
        #   redirect_to musicals_path

    end

    private
    
    def session_params
        params.require(:session).permit(:username, :email, :password)
    end

    def github_params
        request.env['omniauth.auth']
    end


end