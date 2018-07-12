ActiveAdmin.register DispatchedEmail do
  permit_params :body, :budget, :sender_email, :sender_name, :sender_phone_number

  index do
    selectable_column
    id_column
    column :sender_email
    column :sender_name
    column :body
    column :budget
    column :sender_phone_number
    column :created_at
    actions
  end

  filter :created_at
  filter :budget
  filter :sender_name
  filter :sender_email

  form do |f|
    f.inputs do
      f.input :sender_name
      f.input :sender_email
      f.input :sender_phone_number
      f.input :budget
      f.input :body
    end
    f.actions
  end
end
