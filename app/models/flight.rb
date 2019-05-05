class Flight < ApplicationRecord
    has_many :flight_executions
    has_many :airplanes, through: :flight_executions
    
    validates :code, :departure, :destination, presence: true
    validates :code, uniqueness: { case_sensitive: false }
end
