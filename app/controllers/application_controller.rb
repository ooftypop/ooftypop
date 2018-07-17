class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    else
      dashboard_index_path
    end
  end
end
