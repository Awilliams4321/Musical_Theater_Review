class ReviewsController < ApplicationController
    # before_action :set_method, only: [:new, :create, :update, :destroy]
    # before_action :is_logged_in?

    def new
        @review = Review.new
        @musicals = Musical.all
        @musical = Musical.find_by(id: params[:musical_id])
        # @musical = Musical.find_by(params[:id])

        @review.build_musical(id: params[:musical_id])
    end

    def create
        @musical = Musical.find(params[:musical_id])
        @review = @musical.reviews.create(review_params)
        if @review.save
            redirect_to musical_reviews_path(@review)
        else
            render :new 
        end 
    end 

    def index
        if params[:musical_id]
            @musicals = Musical.all
            @reviews = Review.all
        else
            @review = Review.find_by(id: params[:id])
        end
    end 

    def show 
        @review = Review.find_by(id: params[:id])

    end 

    def edit
        @musical = Musical.find_by(id: params[:musical_id])
        @review = @musical.reviews 
        # Review.find_by(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to musical_review_path(@review)
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        @review.destroy
        redirect_to reviews_path
    end
       

    private
    #Whitelisting attributes(permitting mass assignment)
    #Strong params

    def review_params
        params.require(:review).permit(:musical_id, :headline, :content, :public_name, musicals_attributes: [:name, :musical_id]) #users and musicals attr.
    end 

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
