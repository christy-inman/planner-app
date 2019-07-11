class ListsController < ApplicationController
    before_action :get_user
    before_action :find_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to lists_path
        else
            render :new
        end

    end

    def update
        @list.update(list_params)
    end

    def edit
    end

    def show
    end

    def destroy
        redirect_to lists_path
    end


    private

    def find_list
        
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:title)
    end
    
end
