class UserSerializer < ActiveModel::Serializer
  attributes :email, :remember_token
end
