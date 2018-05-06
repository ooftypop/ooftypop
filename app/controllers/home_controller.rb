class HomeController < ApplicationController
  def index
    @dispatched_email = DispatchedEmail.new
  end
end
