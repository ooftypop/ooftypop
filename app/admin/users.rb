ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :middle_name, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :current_sign_in_at
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
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes, multiple: true, collection: Role.all
    end
    f.actions
  end

  action_item(:new) do
      link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation do
      @user = User.new
      end

  collection_action :send_invitation, :method => :post do
      @user = User.invite!(permitted_params[:user], current_user)
      if @user.errors.empty?
          flash[:success] = "User has been successfully invited."
          redirect_to admin_users_path
      else
          messages = @user.errors.full_messages.map { |msg| msg }.join
          flash[:error] = "Error: " + messages
          redirect_to new_invitation_admin_users_path
      end
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
      row :created_at
      row :sign_in_count
    end
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
end
