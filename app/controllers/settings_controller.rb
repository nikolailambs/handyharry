class SettingsController < ApplicationController
  def show
    skip_authorization
    @current_user = current_user
  end
end
