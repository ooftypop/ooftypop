class PortfolioItemsController < ApplicationController

  before_action :set_portfolio_item, except: [:index]

  def index
    @portfolio_items = PortfolioItem.all
  end

  def show
  end

  def new
  end

  def create
    @portfolio_item.assign_attributes(portfolio_item_params)
    if @portfolio_item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @portfolio_item.update_attributes(portfolio_item_params)
  end

  def destroy
  end

  private

  def set_portfolio_item
    @portfolio_item = params[:id].present? ? PortfolioItem.find(params[:id]) : PortfolioItem.new
  end

  def portfolio_item_params
    params.require(:portfolio_item).permit(
      :description,
      :id,
      :title,
      :url
    )
  end
end
