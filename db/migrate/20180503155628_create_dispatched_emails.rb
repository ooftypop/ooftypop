class CreateDispatchedEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatched_emails do |t|
      t.string :sender_email
      t.text :sender_body
      t.decimal :sender_budget, :precision => 8, :scale => 2
      t.string :sender_first_name
      t.string :sender_last_name
      t.string :sender_phone_number
    end
  end
end
