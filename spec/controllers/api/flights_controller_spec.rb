require 'rails_helper'

RSpec.describe Api::FlightsController, type: :controller do
  describe 'GET #index' do
    context 'if user is not authenticated' do
      it 'should return error 401' do
        get :index
        expect(response.status).to eq(401)
      end
    end

    context 'if user is authenticated' do
      it 'should return a list of flights' do
        user = create(:user)
        flights = create_list(:flight, Random.rand(10))
        sign_in_as(user) # clearance gem helper
        get :index

        assert_equal @flights, assigns(:flights)
      end
    end
  end
end
