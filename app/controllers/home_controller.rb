class HomeController < ApplicationController
  def index
    @dispatched_email = DispatchedEmail.new
    @portfolio_item   = PortfolioItem.all
    @portfolio_items = PortfolioItem.paginate(:page => params[:page], :per_page => 8)
  end
end
