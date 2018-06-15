class RenameSenderFirstNameInDispatchedEmails < ActiveRecord::Migration[5.2]
  def change
    rename_column :dispatched_emails, :sender_first_name, :sender_name
  end
end
