ActiveAdmin.register Project do
permit_params :title

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.attachment_field :images_files, multiple: true, presigned: true, direct: true
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
    end
  end
end
