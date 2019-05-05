require 'rails_helper'

RSpec.describe Api::FlightBookingsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = create(:user)
      @flight = create(:flight)
    end

    context 'if user is not authenticated' do
      it 'should return error 401' do
        post :create, params: { flight_id: @flight.id }
        expect(response.status).to eq(401)
      end
    end

    context 'if user is authenticated' do
      context 'with invalid attributes' do
        it 'should not add new passengers to the flight' do
          passenger_number = rand(1..4)
          expect {
            post :create, params: {
              user_id: @user.id,
              flight_id: @flight.id,
              passengers: attributes_for_list(:invalid_passenger, passenger_number)
            }
          }.to_not change(@flight.passengers, :count)
        end
      end

      context 'with valid attributes' do
        it 'should add the user as passenger to the flight' do
          passenger_number = rand(1..4)
          expect {
            post :create, params: {
              user_id: @user.id,
              flight_id: @flight.id,
              passengers: attributes_for_list(:passenger, passenger_number)
            }
          }.to change(@flight.passengers, :count).by(passenger_number)
        end
      end
    end
  end
end
