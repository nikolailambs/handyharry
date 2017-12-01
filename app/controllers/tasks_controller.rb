class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    #@tasks = Task.all
    @tasks = policy_scope(Task).order(created_at: :desc)
    @project = Project.find(params[:project_id])
    @tasks.project = @project
  end

  def create # only the user
    @task = Task.new(task_params)
    @project = Project.find(params[:project_id])
    @task.project = @project
    authorize @task

    if @task.save
      flash[:notice] = "Task added"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Something went wrong"
      render "projects/show"
    end
  end

  def update
    if @task.update(task_params)
        flash[:notice] = "Task updated"

        @project_completion = @task.project.completion_percentage
      respond_to do |format|
        format.html { redirect_to project_path(@task.project) }
        format.js # render tasks/update.js.erb
      end
    else
      flash[:alert] = "Something went wrong"
      render "projects/show"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to projects_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
