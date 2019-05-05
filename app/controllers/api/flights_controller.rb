class Api::FlightsController < ApiController
  def index
    if signed_in?
      flights = Flight.all
      render json: flights, each_serializer: FlightSerializer, status: :ok
    else
      render json: { errors: 'Authentication failed, you are not authorized to access this resource' }, status: 401
    end
  end
end