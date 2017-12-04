class StatusesController < ApplicationController

 def index
    # @projects = Project.all
    # @projects.clients = Project.select { |client| client.user.handy == false}
    # @projects.handy = current_user
    skip_authorization
    # @projects = Project.find_by(handy_id: current_user)

    @client = Project.includes(:client_id).where(projects: current_user.projects).map(&::client_id)
  end
end

