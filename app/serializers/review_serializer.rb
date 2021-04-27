class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :author, :course
end
