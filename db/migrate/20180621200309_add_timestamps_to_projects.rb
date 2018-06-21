class AddTimestampsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :created_at, :datetime, null: false
    add_column :projects, :updated_at, :datetime, null: false
  end
end
