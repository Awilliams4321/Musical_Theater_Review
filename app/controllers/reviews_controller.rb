class ReviewsController < ApplicationController
    # before_action :set_method, only: [:new, :create, :update, :destroy] 

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
        @review = Review.find_by(params[:id])
        if @review.save
            redirect_to review_path
        else
            render :new 
        end 
    end 

    private
    #Whitelisting attributes(permitting mass assignment)
    #Strong params

    def review_params
        params.require(:review).permit(:musical_id, :id, :headline, :content, :public_name)
    end 
end
