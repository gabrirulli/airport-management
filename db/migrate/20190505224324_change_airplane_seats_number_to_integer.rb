class ChangeAirplaneSeatsNumberToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :airplanes, :seats_number, :integer
  end
end
