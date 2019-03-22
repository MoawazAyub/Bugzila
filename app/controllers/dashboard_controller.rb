class DashboardController < ApplicationController
  def index
  end

  def assign
  	redirect_back(fallback_location: root_path)
  end
end