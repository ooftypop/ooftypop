ActiveAdmin.register Project do
permit_params :title, users_roles_attributes: [role_ids: [], user_ids: []]

  # before_create do
  #   Role.save_roles[:roles]
  # end

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs 'Project' do
      f.input :title
    end
    f.inputs 'Developers' do
      f.has_many :users_roles, allow_destroy: true, heading: 'New Developer' do |f|
        f.input :role, as: :select, multiple: true, collection: Role.all
        f.input :user, as: :select, multiple: true, collection: User.all.map {|user| [user.first_name, user.id] }
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      # row :users_role do |users_role|
      #   attributes_table_for users_role do
      #     row :users do |users|
      #       attributes_table_for users do
      #         row :roles do |project|
      #           project.roles.collect {|c| c.name.capitalize }.to_sentence
      #         end
      #       end
      #     end
      #   end
      # end
    end
  end

# ===========================================================================================================================================================
# Projects Controller =======================================================================================================================================
# ===========================================================================================================================================================

  controller do

    def create
      super
    end

    # def project_roles
    #   self.Role.each do |r|
    #     r.save_roles
    #   end
    # end
  end
end
