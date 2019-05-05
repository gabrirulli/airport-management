require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it 'is valid with valid attributes' do
    expect(create(:passenger)).to be_valid
  end
end
