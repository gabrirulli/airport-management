class FlightSerializer < ActiveModel::Serializer
  attributes :code, :departure, :destination, :duration, :airplanes

  def airplanes
    object.flight_executions.map { |fe|
      [
        code: fe.airplane.code,
        departure: fe.departure_date_time.strftime('%Y-%m-%d %H:%M'),
        arrival: fe.arrival_date_time.strftime('%Y-%m-%d %H:%M')
      ]
    }
  end
end
