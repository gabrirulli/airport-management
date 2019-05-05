require 'rails_helper'

RSpec.describe Api::RegistrationController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'should create new user in database' do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'should not create new user in database' do
        expect {
          post :create, params: { user: attributes_for(:invalid_user) }
        }.to_not change(User, :count)
      end
    end
  end
end
