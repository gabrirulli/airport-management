ActiveAdmin.register Airplane do
  permit_params :code, :seats_number

  index do
    id_column
    column :code
    column :seats_number
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :seats_number, label: 'Number of seats'
    end
    f.actions
  end
end
