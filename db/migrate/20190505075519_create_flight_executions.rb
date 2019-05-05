class CreateFlightExecutions < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_executions do |t|
      t.belongs_to :airplane, null: false
      t.belongs_to :flight, null: false
      t.datetime :departure_date_time
      t.datetime :arrival_date_time

      t.timestamps
    end
  end
end
