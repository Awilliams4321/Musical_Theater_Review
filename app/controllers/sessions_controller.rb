class SessionsController < ApplicationController

    def new
        render :login
    end

    def login
        @user = User.find_by(email: params[:email])
       
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to users_show_path(@user)
            binding.pry
        else
            # flash[:error] = "Invalid Email or Password. Please Try Again."
            redirect_to login_path
        end
    end

    def logout
        session.clear
        redirect_to login_path
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