class BooksController < ApplicationController
	before_action :authorize

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		book = Book.new(params.require(:book).permit(:title))
		book.customer_id = current_customer.id 
		book.image.attach(params[:book][:image])

		if book.save 
			order = Order.create!(customer_id: current_customer.id)
			line_item = LineItem.create!(book_id: book.id, order_id: order.id, quantity: 1)
		else
			# should add errors
			render :new 
		end

		redirect_to book
	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to request.env["HTTP_REFERER"]
  	end

	private
	
end