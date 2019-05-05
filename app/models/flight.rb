class Flight < ApplicationRecord
    validates :code, :departure, :destination, presence: true
    validates :code, uniqueness: { case_sensitive: false }
end
