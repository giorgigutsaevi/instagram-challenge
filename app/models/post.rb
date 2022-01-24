class Post < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	validates :title, presence: true
	delegate :username, :to => :user
end
