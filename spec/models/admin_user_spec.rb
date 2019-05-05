require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'creates valid admin user' do
    expect(create(:admin_user)).to be_valid
  end
end
