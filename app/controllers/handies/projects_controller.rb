class Handies::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)

    if @project.save
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.delete
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:address, :deadline, :description, :title)
  end
end
