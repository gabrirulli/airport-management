class Flight < ApplicationRecord
  has_many :flight_executions
  has_many :airplanes, through: :flight_executions
  accepts_nested_attributes_for :flight_executions, allow_destroy: true

  validates :code, :departure, :destination, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
