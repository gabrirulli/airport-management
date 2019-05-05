ActiveAdmin.register Flight do
    permit_params :code, :departure, :destination
    
    index do
        id_column
        column :code
        column :departure
        column :destination
        column :duration
        actions
    end

    form do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs do
            f.input :code
            f.input :departure
            f.input :destination
        end
        
        f.actions
    end

end
