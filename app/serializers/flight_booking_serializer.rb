class FlightBookingSerializer < ActiveModel::Serializer
  attributes :id, :code, :departure, :destination, :duration, :airplanes, :passengers
  has_many :passengers, serializer: PassengerSerializer

  def airplanes
    object.flight_executions.map { |fe|
      [
        code: fe.airplane.code,
        departure: fe.departure_date_time.strftime('%Y-%m-%d %H:%M'),
        arrival: fe.arrival_date_time.strftime('%Y-%m-%d %H:%M')
      ]
    }
  end

  def passengers
    object.passengers.select { |p| p.user == current_user }
  end
end
