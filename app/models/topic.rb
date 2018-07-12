class Topic < ApplicationRecord
	belongs_to :user
	belongs_to :product
	has_many :comments
end
