class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path(resource)
    else
      dashboard_index_path
    end
  end
end
