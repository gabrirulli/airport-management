class FlightExecution < ApplicationRecord
  belongs_to :flight
  belongs_to :airplane

  validates :departure_date_time, :arrival_date_time, presence: true
end
