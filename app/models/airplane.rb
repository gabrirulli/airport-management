class Airplane < ApplicationRecord
  has_many :flight_executions, dependent: :destroy
  has_many :flights, through: :flight_executions

  validates :code, :seats_number, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
