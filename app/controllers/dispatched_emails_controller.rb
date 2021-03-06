class DispatchedEmailsController < ApplicationController

  before_action :set_dispatched_email, except: [:index]

  def new
  end

  def create
    @dispatched_email.assign_attributes(dispatched_email_params)
    if @dispatched_email.save
      DispatchedEmailMailer.inquire_confirmation(@dispatched_email).deliver_now
      render "inquiry_received.js"
    else
      render "home#index"
    end
  end

  private

  def set_dispatched_email
    @dispatched_email = params[:id].present? ? DispatchedEmail.find(params[:id]) : DispatchedEmail.new
  end

  def dispatched_email_params
    params.require(:dispatched_email).permit(
      :body,
      :budget,
      :id,
      :sender_email,
      :sender_name,
      :sender_phone_number)
  end
end
