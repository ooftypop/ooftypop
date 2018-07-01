class CreateUserProjectsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects, id: false do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
