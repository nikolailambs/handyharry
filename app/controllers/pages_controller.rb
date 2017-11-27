class PagesController < ApplicationController
  skip_before_action :authenticate_handy!, only: [:home]
  skip_before_action :authenticate_client!, only: [:home]

  def home
  end
end
