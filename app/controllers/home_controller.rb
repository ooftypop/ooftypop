class HomeController < ApplicationController
  def index
    @dispatched_email = DispatchedEmail.new
    @portfolio_item   = PortfolioItem.all
  end
end
