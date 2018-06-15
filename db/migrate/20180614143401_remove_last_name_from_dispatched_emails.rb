class RemoveLastNameFromDispatchedEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :dispatched_emails, :sender_last_name
  end
end
