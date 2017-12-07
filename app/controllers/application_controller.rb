class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_current_user

  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_current_user
    User.current_user = current_user
  end

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:handy, :first_name, :last_name])
  end

    def after_sign_in_path_for(resource)
     projects_path || request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end

end
