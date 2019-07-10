class ListsController < ApplicationController
    before_action :find_list, only: [:show, :edit, :update]

    def index
        @lists = List.all
    end

    def new
        @list = List.new
    end

    def create
        @list = List.create(list_params)
        redirect_to lists_index
    end

    def update
        @list.update(list_params)
    end

    def edit
    end

    def show
    end


    private

    def find_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:title, :task_id, :start_time, :end_time, :start_date, :end_date)
    end
    
end
