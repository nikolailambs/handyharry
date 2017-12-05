class StatusesController < ApplicationController

  def index
    skip_authorization

    @project_policy = policy_scope(Project).order(created_at: :desc)
    @projects_handy = Project.all.where(handy_id: current_user)

    @hash = {}
    @projects_handy.each do |project|
      if @hash.has_key?(project.client_id)
        @hash[project.client_id] = @hash[project.client_id].push(project)
      else
        @hash[project.client_id] = [project]
      end
    end

    projects_completion_percentage(@hash)

  end


  def projects_completion_percentage(hash)
    @status_projects = []
    @hash.each do |object|
      object[1].each do |project|
        @status_projects << project.status
      end
    end

    amount_projects = @status_projects.count

    status_true = @status_projects.select { |f| f == true }
    amount_true = status_true.count
    @result = (amount_true.to_f / amount_projects.to_f).to_f
    @result.round(2)

  end
end

