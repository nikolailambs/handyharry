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
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js
      end
    else
      flash[:alert] = "Something went wrong"
      respond_to do |format|
        format.html { render "projects/show" }
        format.js  # <-- idem
      end
    end
  end

  def edit
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

    session[:return_to] ||= request.referer

    redirect_to session.delete(:return_to)

  end

  private

  def set_task
    @task = Task.find(params[:id])
    # authorize @task
    skip_authorization
  end

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
