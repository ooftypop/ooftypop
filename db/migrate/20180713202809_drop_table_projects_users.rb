class DropTableProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :projects_users
  end
end
