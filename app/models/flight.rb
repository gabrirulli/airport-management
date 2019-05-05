class Flight < ApplicationRecord
  has_many :flight_executions
  has_many :airplanes, through: :flight_executions
  accepts_nested_attributes_for :flight_executions, allow_destroy: true

  validates :code, :departure, :destination, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  after_save :save_duration

  # Return duration formatted in hours and minutes
  def formatted_duration
    hours = self.duration / 60
    minutes = self.duration % 60
    return "#{hours}h #{minutes}m"
  end

  private
  
  # Save duration of the entire flight in minutes
  def save_duration
    # Get first and last flight executions and calculate minutes of flight duration
    executions = flight_executions.order(departure_date_time: :asc)
    departure = executions.first.departure_date_time
    arrival = executions.last.arrival_date_time

    duration = (arrival - departure) / 60
    # update_column skip validations so this method will be not called more than once
    self.update_column(:duration, duration)
  end
end
