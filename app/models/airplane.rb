class Airplane < ApplicationRecord
    validates :code, :seats_number, presence: true
    validates :code, uniqueness: { case_sensitive: false }
end
