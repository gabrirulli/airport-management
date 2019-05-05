require 'rails_helper'

RSpec.describe Api::FlightBookingsController, type: :controller do
  before(:each) do
    @user = create(:user)
  end

  describe 'POST #create' do
    before(:each) do
      @flight = create(:flight)
    end

    context 'if user is not authenticated' do
      it 'should return error 401' do
        post :create
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

  describe 'GET #index' do
    context 'if user is not authenticated' do
      it 'should return error 401' do
        get :index
        expect(response.status).to eq(401)
      end
    end

    context 'if user is authenticated' do
      it 'should return the list of current user flights booked' do
        sign_in_as(@user) # clearance gem helper
        flights = create_list(:flight, rand(0..10))
        flights.each do |flight|
          flight.passengers << create_list(:passenger, rand(0..3), user: @user, flight: flight)
        end

        get :index

        assert_equal flights, assigns(:flights)
      end
    end
  end

  describe 'GET #show' do
    context 'if user is not authenticated' do
      it 'should return error 401' do
        get :show
        expect(response.status).to eq(401)
      end
    end

    context 'if user is authenticated' do
      it 'should return single current user flight booked' do
        sign_in_as(@user) # clearance gem helper
        flight = create(:flight)
        flight.passengers << create_list(:passenger, rand(0..3), user: @user, flight: flight)

        get :show

        assert_equal flight, assigns(:flight)
      end
    end
  end
end
