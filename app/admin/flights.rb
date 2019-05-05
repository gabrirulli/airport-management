ActiveAdmin.register Flight do
    permit_params :code, :departure, :destination, flight_executions_attributes: [:id, :flight_id, :airplane_id, :departure_date_time, :arrival_date_time, :_destroy]
    
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

        f.inputs do
            f.has_many :flight_executions, allow_destroy: true do |fe|
                fe.input :airplane, collection: Airplane.all.map{ |a| [a.code, a.id]}
                fe.input :departure_date_time
                fe.input :arrival_date_time
            end
        end
        
        f.actions
    end

end
