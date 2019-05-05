class Api::FlightsController < ApiController
  def index
    flights = Flight.all
    render json: flights, each_serializer: FlightsSerializer, status: :ok
  end

  def show
    flight = Flight.find(params[:id])
    render json: flight, serializer: FlightsSerializer, status: :ok
  end
end