class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :slug, :image_url, :duration
  has_many :reviews
end
