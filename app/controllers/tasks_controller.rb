class TasksController < ApplicationController
    before_action :get_user
    before_action :find_task, only: [:show, :edit, :update]

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def show
      
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to list_path(@task.list)
        else
            render :new
        end
    end

    def update
        @task.update(task_params)
    end

    def edit 
        redirect_to list_path(@task.list)
    end

    def destroy   
    end

    private

    def find_task
      
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :start_time, :end_time, :start_date, :end_date, :list_id)
    end

end