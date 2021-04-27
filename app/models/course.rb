class Course < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save :slugify
  
  def slugify
    self.slug = title.parameterize
  end
  
  def avg_score
    reviews.average(:score).round(1).to_f
  end
end
