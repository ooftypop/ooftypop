class RenameSenderBodyInDispatchedEmails < ActiveRecord::Migration[5.0]
  def change
    rename_column :dispatched_emails, :sender_body, :body
  end
end
