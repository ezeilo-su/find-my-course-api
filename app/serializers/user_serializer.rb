class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username
  has_one :token
end
