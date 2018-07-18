class Book < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many_attached :images
end