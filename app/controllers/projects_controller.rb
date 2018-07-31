class ProjectsController < ApplicationController
  before_action :set_project, except: [:index]

  def show
  end

  private

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(
      :title,
      users_role_attributes: [:role_id, :user_id]
    )
  end

end
