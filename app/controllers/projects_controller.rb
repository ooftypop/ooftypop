class ProjectsController < ApplicationController

  before_action :set_project, except: [:index]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @project.assign_attributes(project_params)
    if @project.save
      redirect_to dashboard_index_path
    else
      render "new"
    end
  end

  def update
    @project.update_attributes(project_params)
  end

  def destroy
  end

  private

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(
      :title,
      projects_users: [:user_id])
  end
end
