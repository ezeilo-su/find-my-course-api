class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :course
end
