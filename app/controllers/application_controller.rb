class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate!

  def authenticate!
   :authenticate_handy! || :authenticate_client!
   @current_user = handy_signed_in? ? current_handy : current_client
 end

end
