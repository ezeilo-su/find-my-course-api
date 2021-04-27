class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  validates :user_id, presence: true
  validates :course_id, presence: true
  validates_uniqueness_of :course, :scope => :user
  # validates :course, uniqueness: { scope: :user }
end
