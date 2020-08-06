class ReviewsController < ApplicationController
    # before_action :set_method, only: [:new, :create, :update, :destroy] 
    before_action :is_logged_in?, except: :index

    def index
        if params[:musical_id]
            @musical = Musical.find(params[:musical_id])
            @reviews = @musical.reviews
        else
            @reviews = Review.all
        end
    end

    def show 
        @review = Review.find_by(params[:id])
        @musical = Musical.find_by(params[:id])
    end 

    def new
        @review = Review.new
        @musicals = Musical.all

        @review.build_musical(params[:musical_id])
    end

    def create
        @musical = Musical.find_by(params[:id])
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new 
        end 
    end 

    def edit
        # redirect to "/" if !is_logged_in?

        @musical = Musical.find_by(params[:id])
        @review = Review.find_by(params[:id])
    end

    def update
        # redirect to "/" if !is_logged_in?

        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        # redirect to "/" if !is_logged_in?

        @review = Review.find_by(params[:id])
        @review.destroy
        redirect_to reviews_path
    end
        

    private
    #Whitelisting attributes(permitting mass assignment)
    #Strong params

    def review_params
        params.require(:review).permit(:musical_id, :headline, :content, :public_name)
    end 
end
