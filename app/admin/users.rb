ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :middle_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :middle_name
    column :last_name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :last_name
  filter :email

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
