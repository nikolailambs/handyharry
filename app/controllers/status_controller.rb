class StatusController < ApplicationController

  def index
    skip_authorization

    @project_policy = policy_scope(Project).order(created_at: :desc)
    @projects_handy = Project.all.where(handy_id: current_user.id)

    @hash = {}
    @projects_handy.each do |project|
      @tasks = Task.all.where(project_id: project.id)

      if @hash.has_key?(project.client_id)
        @hash[project.client_id] = @hash[project.client_id].push(project_completion_status)
      else
        @hash[project.client_id] = [project_completion_status]
      end
    end
  end

  def project_completion_status

    if @tasks.empty?
      project_status = 1.0
    else
      amount_tasks = @tasks.count
      status_true = @tasks.select { |f| f.status == true }
      amount_true = status_true.count
      result = (amount_true.to_f / amount_tasks.to_f).to_f
      project_status = result.round(2)
    end
  end
end

