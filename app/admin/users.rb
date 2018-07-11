ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :middle_name, role_ids: []

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
    column :roles do |user|
      user.roles.collect {|c| c.name.capitalize }.to_sentence
    end
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
      f.input :roles, as: :check_boxes, multiple: true, collection: Role.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :middle_name
      row :last_name
      row :email
      row :phone_number
      row :roles do |user|
        user.roles.collect {|c| c.name.capitalize }.to_sentence
      end
    end
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
end
