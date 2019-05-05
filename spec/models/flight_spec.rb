require 'rails_helper'

RSpec.describe Flight, type: :model do
  it 'is valid with valid attributes' do
    expect(create(:flight)).to be_valid
  end

  describe '#code' do
    it 'has a unique value' do
      first_flight = create(:flight)
      second_flight = build(:flight, code: first_flight.code)
      expect(second_flight).to_not be_valid
    end
  end
end
