ActiveAdmin.register Project do
permit_params :title, users_roles_attributes: [role_ids: [], user_ids: []]

  before_create do
    Role.save_roles[:roles]
  end

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    render partial: 'form'
  end

  show do
    attributes_table do
      row :title
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
