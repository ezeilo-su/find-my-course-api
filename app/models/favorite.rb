class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :course, dependent: :destroy
  
  validates :user_id, presence: true
  validates :course_id, presence: true
end
