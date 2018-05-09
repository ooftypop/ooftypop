class RenameSenderBudgetInDispatchedEmails < ActiveRecord::Migration[5.0]
  def change
    rename_column :dispatched_emails, :sender_budget, :budget
  end
end
