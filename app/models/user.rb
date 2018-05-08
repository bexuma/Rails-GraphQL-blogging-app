class User < ApplicationRecord
	before_save { email.downcase! }
	has_secure_password

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	has_many :posts
	validates :name, presence: true, length: { maximum: 50 }
  	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
  				      format: { with: VALID_EMAIL_REGEX }
 	validates :password, presence: true, length: { minimum: 6 }
end
