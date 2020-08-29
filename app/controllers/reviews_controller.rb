class ReviewsController < ApplicationController
    include ApplicationHelper
    before_action :require_login
    before_action :find_musical, only: [:new, :create, :show, :edit]
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :current_user, only:  [:new, :create, :edit, :update]

    def new
        @review = Review.new
        @musicals = Musical.all
        @review.build_musical(id: params[:musical_id])
    end

    def create
        @musicals = Musical.all
        @review = @musical.reviews.build(review_params)
        @review.user_id = current_user.id
        if @review.save
            redirect_to review_path(@review)
        else
            render :new 
        end 
    end 

    def index
        if params[:musical_id]
            @musical = Musical.find_by(id: params[:musical_id])
            @reviews = @musical.reviews
        elsif
            params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @reviews = @user.reviews.most_recent
        else
            @reviews = Review.all
        end
    end 

    def show 
    end 

    def edit
        if @review && @review.user_id == current_user.id
            render
        else          
            redirect_to musicals_path, danger: "You can't edit a review you didn't create!"
        end
    end

    def update
        if @review && @review.user_id == current_user.id
            @review.update(review_params)
            redirect_to musical_review_path(@review.musical, @review)
        else
            redirect_to musicals_path, danger: "You can't edit a review you didn't create!"
        end
    end

    def destroy
        if @review && @review.user_id == current_user.id
            @review.destroy
            redirect_to reviews_path
        else 
            redirect_to musicals_path, danger: "You can't delete a review you didn't create!"
        end
    end
       

    private
    #Whitelisting attributes(permitting mass assignment)
    #Strong params

    def review_params
        params.require(:review).permit(:musical_id, :headline, :content, :public_name, musicals_attributes: [:name, :musical_id])
    end 

    def find_musical
        @musical = Musical.find_by(id: params[:musical_id])
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end
end

