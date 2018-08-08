class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      bypass_sign_in(@user) if params[:user][:password].present?
      flash_message("success")
      redirect_back fallback_location: root_path
    else
      flash_message("alert")
      render "edit"
    end
  end

  private

  def set_user
    @user = params[:id].present? ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :middle_name,
      :last_name,
      :phone_number,
      :password,
      :password_confirmation
    )
  end
end
