ActiveAdmin.register PortfolioItem do
permit_params :description, :title, :url

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :url
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :url
    # column :created_at
    # column :updated_at
    actions
  end

end
