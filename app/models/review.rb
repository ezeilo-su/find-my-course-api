class Review < ApplicationRecord
  belongs_to :course
  belongs_to :author, class_name: 'User'

  validates :author_id, presence: true
  validates :course_id, presence: true

  validates :score, presense: true, numericality: { only_integer: true }
end
