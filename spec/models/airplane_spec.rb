require 'rails_helper'

RSpec.describe Airplane, type: :model do
  it 'creates valid airplane' do
    expect(create(:airplane)).to be_valid
  end

  describe '#code' do
    it 'has a unique value' do
      first_airplane = create(:airplane)
      second_airplane = build(:airplane, code: first_airplane.code)
      expect(second_airplane).to_not be_valid
    end
  end
end
