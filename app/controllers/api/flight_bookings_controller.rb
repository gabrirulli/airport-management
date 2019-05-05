class Api::FlightBookingsController < ApiController
  def index
    flights = current_user.flights.uniq
    render json: flights, each_serializer: FlightBookingSerializer, status: :ok
  end

  def show
    flight = Flight.find(params[:id])
    render json: flight, serializer: FlightBookingSerializer, status: :ok
  end

  def create
    flight = Flight.find(params[:flight_id])
    if check_flight_seats_number_available(flight, params[:passengers].count).any?
      render json: { errors: 'There are no more seats available' }, status: 400
      return
    end
    
    # Begin transaction database transaction with ActiveRecord
    # If a passenger can't be created, also the others can't be created
    ActiveRecord::Base.transaction do
      params[:passengers].each do |passenger|
        Passenger.create!(
          user_id: current_user.id,
          flight_id: params[:flight_id],
          first_name: passenger[:first_name],
          last_name: passenger[:last_name],
          fiscal_code: passenger[:fiscal_code]
        )
      end
    end

    render json: flight, serializer: FlightBookingSerializer, status: :ok

  rescue ActiveRecord::RecordInvalid
    render json: { errors: 'Something on passenger creation went wrong. Check carefully the data inserted' }, status: 400
  end

  private

  def check_flight_seats_number_available(flight, passenger_count)
    return flight.flight_executions.select { |fe| fe.airplane_is_full(passenger_count) }
  end
end