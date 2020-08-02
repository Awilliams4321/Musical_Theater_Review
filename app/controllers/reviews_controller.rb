class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
        @musicals = Musical.all
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to reviews_path
        else
            redirect_to reviews_new_path
        end 
    end 

    private
    #Whitelisting attributes(permitting mass assignment)
    #Strong params

    def review_params
        params.require(:review).permit(:headline, :content, :public_name)
    end 
end
