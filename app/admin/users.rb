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

  action_item do
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

end
