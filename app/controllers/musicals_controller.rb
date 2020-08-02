class MusicalsController < ApplicationController

    def index
        @musicals = Musical.all
    end

    def show
        @musical = Musical.find_by(params[:id])
    end

end
