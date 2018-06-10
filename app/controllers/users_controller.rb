class UsersController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  include SmartListingConcern

  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    @user.update_attributes(user_params)
  end

  def destroy
  end

  private

  def set_user
    @user = params[:id].present? ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(
      :id,
      :first_name,
      :middle_name,
      :last_name,
      :email,
      :password)
  end
end
