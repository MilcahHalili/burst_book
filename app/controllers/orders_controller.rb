class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def index
		@books = Book.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
	end

	def show
		if params[:id] == 'cart'
			@order = current_customer.cart
		else
			@order = Order.find(params[:id])
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :street, :city, :zip_code)
	end
	
end