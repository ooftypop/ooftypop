class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    else
      dashboard_index_path
    end
  end

  def user_not_authorized(exception)
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
