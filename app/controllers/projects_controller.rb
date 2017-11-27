class ProjectsController < ApplicationController
  def index
  end

  def show
    # @project = Project.find(params[:project_id])
    # @tasks = Task.all
    # @task.project = @project
  end

  def new
    @project = Project.new
    @project.tasks.build
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
