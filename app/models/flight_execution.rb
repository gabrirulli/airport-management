class FlightExecution < ApplicationRecord
  belongs_to :flight
  belongs_to :airplane

  validates :departure_date_time, :arrival_date_time, presence: true

  def airplane_is_full(new_passengers_count)
    (flight.passengers.count + new_passengers_count) > airplane.seats_number
  end
end
