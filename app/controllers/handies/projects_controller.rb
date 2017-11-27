class Handies::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    @project.tasks.build
  end

  def create
    @project = Project.new(project_params)
    @project.handy = current_handy #in the end it should be the client doing the tasks
    @client = Client.find(params[:project][:client_id])
    @project.client = @client

    if @project.save
      redirect_to handies_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to handies_projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:address, :deadline, :description, :title, :client_id, tasks_attributes: [:id, :title, :description, :assigned_to, :deadline])
  end
end

