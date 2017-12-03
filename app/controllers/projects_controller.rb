class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = policy_scope(Project).order(created_at: :desc)
    @tasks = policy_scope(Task).order(created_at: :desc)

  end

  def show
    @task = Task.new
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create # only the user
    @project = Project.new(project_params)
    @project.client = current_user #in the end it should be the client doing the tasks
    @handy = User.find(params[:project][:handy_id])
    @project.handy = @handy #in the end it should be the handy to whom the tasks gets asigned

    authorize @project

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    raise
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:address, :deadline, :description, :title, :client_id, tasks_attributes: [:id, :title, :description, :assigned_to, :deadline])
  end
end



