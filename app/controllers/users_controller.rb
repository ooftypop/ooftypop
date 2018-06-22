class UsersController < ApplicationController

  before_action :set_user, except: [:index]
  before_action :authenticate_user!

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

  # def update_password
  #   @user = current_user
  #   if @user.update(user_params)
  #     # Sign in the user by passing validation in case their password changed
  #     bypass_sign_in(@user)
  #     redirect_to root_path
  #   else
  #     render "edit"
  #   end
  # end

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
      :email,
      :first_name,
      :id,
      :last_name,
      :middle_name,
      :password)
  end
end
