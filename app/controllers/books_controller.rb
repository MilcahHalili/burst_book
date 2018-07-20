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
		book.customer = current_customer
		book.price = 10
		book.image.attach(params[:book][:image])
		
		if book.save 
			current_customer.cart.add_book(book.id)
			redirect_to book
		else
			redirect_to new_book_path
		end

	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to order_path('cart')
  	end

	private
	
end