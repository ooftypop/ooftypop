class ProjectsController < ApplicationController

  def show

  end

  private

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(
      :title
    )
  end

end
