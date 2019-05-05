class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :code
      t.string :seats_number
      
      t.timestamps
    end
  end
end
