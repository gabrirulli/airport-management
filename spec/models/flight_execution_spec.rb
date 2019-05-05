require 'rails_helper'

RSpec.describe FlightExecution, type: :model do
  it 'is valid with valid attributes' do
    expect(create(:flight_execution)).to be_valid
  end
end
