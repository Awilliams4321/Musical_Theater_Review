class UsersController < ApplicationController

    def new
    end

    def create
        @new_user = User.new(user_params)

        if @new_user
            redirect_to musicals_path
        else
            render :new
        end
    end

    def show
    end 

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
