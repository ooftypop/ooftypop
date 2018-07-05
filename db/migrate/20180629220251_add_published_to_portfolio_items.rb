class AddPublishedToPortfolioItems < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_items, :published, :boolean, default: false
  end
end
