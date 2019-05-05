class User < ApplicationRecord
  include Clearance::User

  has_many :passengers
  has_many :flights, through: :passengers
end
