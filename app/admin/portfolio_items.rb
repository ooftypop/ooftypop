ActiveAdmin.register PortfolioItem do
permit_params :description, :title, :url

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    column :updated_at
    column :url
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :url
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :url
    end
  end
end
