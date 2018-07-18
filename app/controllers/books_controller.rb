class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		book = Book.create! params.require(:book).permit(:name)
		book.images.attach(params[:book][:image])
		redirect_to book
	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
  	end

	private
	
end