class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :code
      t.string :departure
      t.string :destination
      t.integer :duration

      t.timestamps
    end
  end
end
