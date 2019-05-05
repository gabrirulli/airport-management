require 'rails_helper'

RSpec.describe FlightExecution, type: :model do
  it 'creates valid flight_exection' do
    expect(create(:flight_execution)).to be_valid 
  end
end
