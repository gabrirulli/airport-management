require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'should create a new session for existing user' do
        user = create(:user)
        post :create, params: { session: { email: user.email, password: user.password } }
        expect(response.status).to eq(200)
      end
    end

    context 'with invalid attributes' do
      it 'should return error 401' do
        user = create(:user)
        post :create, params: { session: { email: user.email, password: '' } }
        expect(response.status).to eq(401)
      end
    end
  end
end
