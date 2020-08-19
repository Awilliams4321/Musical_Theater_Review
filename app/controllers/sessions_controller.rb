class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def login
        # binding.pry
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            # users_show_path(@user)
        else
            redirect_to login_path, danger: "Invalid email or password."
        end
    end

    def logout
        session.clear
        redirect_to new_users_path
    end

    def github
       
        user = User.find_or_create_by(uid: github_params['uid']) do |u|
            u.username = github_params['info']['name'] || github_params['info']['nickname']
            u.email = github_params['info']['email']
            u.password = github_params['credentials']['token']
          end
       
          session[:user_id] = user.id
       
          redirect_to musicals_path

    end

    private
   
    def session_params
        params.require(:session).permit(:username, :email, :password)
    end

    def github_params
        request.env['omniauth.auth']
    end

end