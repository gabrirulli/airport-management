class PassengerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :fiscal_code
end
