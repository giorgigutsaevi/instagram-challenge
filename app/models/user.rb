class User < ApplicationRecord
	has_many :posts
	validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
										uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: {minimum: 6}
end
