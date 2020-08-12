class MusicalsController < ApplicationController

    def index
        @user = User.find_by(id: params[:id])
        @musicals = Musical.all
    end

    def show
        @musical = Musical.find_by(id: params[:id])
    end

    private

    def musical_params
        params.require(:musical).permit(:name, :city, :state, :venue, :date, :info, :genre) #add reviews_attr.
    end 

end
