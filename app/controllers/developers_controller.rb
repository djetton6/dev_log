class DevelopersController < ApplicationController
    before_action :find_developer, only: [:show, :edit, :update, :destroy]
    
    def index
    end

    def show
    end

    def new
        @developer = Developer.new
    end

    def create
        @developer = Developer.new(developer_params)

        if @developer.save
            redirect_to @developer, notice:"Awesome! You've met a new developer. Don't forget to build something dope together."
        else
            render 'new'
        end
    end 

    private

    def developer_params
        params.require(:developer).permit(:title, :description)
    end

    def find_developer
        @developer = Developer.find(params[:id])
    end
end
