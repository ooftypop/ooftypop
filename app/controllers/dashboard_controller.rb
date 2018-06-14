class DashboardController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  include SmartListingConcern

  def index
    @portfolio_items = smart_listing_create(:portfolio_items,
                                            PortfolioItem.all,
                                            partial: "/dashboard/portfolio_items",
                                            sort_attributes: [[:title, 'title'],
                                                              [:description, 'description'],
                                                              [:url, 'url']],
                                            default_sort: { name: "asc" })

    @users = smart_listing_create(:users,
                                  User.all,
                                  partial: "/dashboard/users_index",
                                  sort_attributes: [[:first_name, 'first_name'],
                                                    [:middle_name, 'middle_name'],
                                                    [:last_name, 'last_name'],
                                                    [:email, 'email']],
                                  default_sort: { name: "asc" })
  end
end
