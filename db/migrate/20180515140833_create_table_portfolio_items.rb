class CreateTablePortfolioItems < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_items do |t|
      t.text   :description
      t.string :title
      t.string :url
    end
  end
end
