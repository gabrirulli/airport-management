class Passenger < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :first_name, :last_name, :fiscal_code, presence: true
end
