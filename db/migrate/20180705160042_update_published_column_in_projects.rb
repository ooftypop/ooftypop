class UpdatePublishedColumnInProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :portfolio_items, :published, :boolean, default: false
  end
end
