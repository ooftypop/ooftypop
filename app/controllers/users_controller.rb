class UsersController < ApplicationController

  before_action :set_user, except: [:index]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user.assign_attributes(user_params)
    if @user.save
      redirect_back fallback_location: root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_back fallback_location: root_path
    else
      render "edit"
    end
  end

  def destroy
  end

  # ============================================================================

  private

  def set_user
    @user = params[:id].present? ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      :middle_name)
  end
end
