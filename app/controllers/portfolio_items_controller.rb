class PortfolioItemsController < ApplicationController

  before_action :set_portfolio_item, except: [:index]
  
  private

  def set_portfolio_item
    @portfolio_item = params[:id].present? ? PortfolioItem.find(params[:id]) : PortfolioItem.new
  end

  def portfolio_item_params
    params.require(:portfolio_item).permit(
      :description,
      :id,
      :published,
      :title,
      :url
    )
  end
end
