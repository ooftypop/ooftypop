class ProjectsController < ApplicationController

  def show
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      images_files: []
    )
  end
end
