class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 6, maximum: 30 }, # format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :favorites, dependent: :destroy
  has_many :favorite_courses, through: :favorites, source: :course
end
