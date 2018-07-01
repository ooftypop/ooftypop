class DashboardController < ApplicationController

  def index
    @project = Project.all
  end

end
