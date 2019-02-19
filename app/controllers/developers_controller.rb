class DevelopersController < ApplicationController
    before_action :find_developer, only: [:show, :edit, :update, :destroy]
    
    def index
        @developer = Developer.all.order("created_at DESC")
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

    def edit
    end 

    def update
      if @developer.update(developer_params)
        redirect_to @developer
      else
        render 'edit'
      end
    end

    def destroy
      @developer.destroy
      redirect_to root_path, notice: "Developer Deleted"
    end

    private

    def developer_params
        params.require(:developer).permit(:title, :description, :image)
    end

    def find_developer
        @developer = Developer.find(params[:id])
    end
end
