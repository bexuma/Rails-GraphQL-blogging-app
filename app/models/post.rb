class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2 }
	validates :content, presence: true, length: { minimum: 5 }
	belongs_to :user
end
