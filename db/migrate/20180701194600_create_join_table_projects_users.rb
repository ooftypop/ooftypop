class CreateJoinTableProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :projects do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
