class Api::FlightBookingsController < ApiController
  def index
    flights = current_user.flights.uniq
    render json: flights, each_serializer: FlightBookingSerializer, status: :ok
  end

  def create
    if current_user.id != params[:user_id]
      render json: { errors: 'Cannot execute action for other users. Your id is different from user_id passed in form' }, status: 400
      return
    end
    
    # Begin transaction database transaction with ActiveRecord
    # If a passenger can't be created, also the others can't be created
    ActiveRecord::Base.transaction do
      params[:passengers].each do |passenger|
        Passenger.create!(
          user_id: params[:user_id],
          flight_id: params[:flight_id],
          first_name: passenger[:first_name],
          last_name: passenger[:last_name],
          fiscal_code: passenger[:fiscal_code]
        )
      end
    end

    flight = Flight.find(params[:flight_id])

    render json: flight, serializer: FlightBookingSerializer, status: :ok

  rescue ActiveRecord::RecordInvalid
    render json: { errors: 'Something on passenger creation went wrong. Check carefully the data inserted' }, status: 400
  end
end