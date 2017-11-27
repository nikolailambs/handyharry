class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :
  before_action :authenticate!

  def authenticate!
    authenticate_handy! || authenticate_client!
  end
end
