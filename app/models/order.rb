class Order < ApplicationRecord
	before_action :authorize
	belongs_to :customer
	has_many :line_items, dependent: :destroy
	has_many :books, through: :line_items

	def add_book(book_id)
		line_item = LineItem.find_by(order: self, book_id: book_id)
		if line_item
			line_item.quantity += 1
			line_item.save
		else
			LineItem.create(order: self, book_id: book_id, quantity: 1)
		end
	end
end
