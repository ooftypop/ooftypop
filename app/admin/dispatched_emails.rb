ActiveAdmin.register DispatchedEmail do
permit_params :body, :budget, :sender_email, :sender_name, :sender_phone_number

  form do |f|
    f.inputs do
      f.input :sender_name
      f.input :sender_phone_number
      f.input :sender_email
      f.input :body
      f.input :budget
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :sender_name
    column :sender_email
    column :body
    column :budget
    column :sender_phone_number
    actions
  end
end
