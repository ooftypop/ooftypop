class DispatchedEmailsController < ApplicationController

  def index
    @dispatched_emails = DispatchedEmails.all
  end

  def show
    @dispatched_email = DispatchedEmail.find(params[:id])
  end

  def new
    @dispatched_email = DispatchedEmail.new
  end

  def edit
    @dispatched_email = DispatchedEmail.find(params[:id])
  end

  def create
    @dispatched_email = DispatchedEmail.new(dispatched_email_params)
    if @dispatched_email.save
      flash[:success] = "Success!"
      redirect_to root_path
    else
      flash[:danger] = "Please Try Again!"
      render "home#index"
    end
  end

  def update
  end

  def destroy
  end

  private

  def dispatched_email_params
    params.require(:dispatched_email).permit(
      :id,
      :sender_body,
      :sender_budget,
      :sender_email,
      :sender_first_name,
      :sender_last_name,
      :sender_phone_number)
  end


end
