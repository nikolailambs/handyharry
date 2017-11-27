class TasksController < ApplicationController

   before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.all
    @task.project = @project
  end

  def create
    @project = Project.find(params[:project_id])
    @tasks = Task.all
    @task.project = @project

    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :assigned_to, status: true, :deadline)
  end

  def set_taks
    @task = Task.find(params[:id])
  end
end
