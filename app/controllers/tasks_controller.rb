class TasksController < ApplicationController

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@task.project)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :assigned_to, :status, :deadline)
  end

end
