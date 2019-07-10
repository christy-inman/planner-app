class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit]


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
        if @task.valid?
            @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def update
        @task.update(task_params)
    end

    def edit 

    end

    private

    def find_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :description)
    end

end