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
		# redirect_to '/confirmation'
		p '$' * 100
		p params 
		p '$' * 100
		if @order.save 
			redirect_to confirmation_order_path(@order)
		else
			p '*' * 100
			p @order.errors
			p '*' * 100
			redirect_back
		end
	end

	def show
		if params[:id] == 'cart'
			@order = current_customer.cart
		else
			@order = Order.find(params[:id])
		end
	end

	def confirmation
		p '*' * 100
		p params 
		p '*' * 100
	end

	private

	def order_params
		params.require(:order).permit(:name, :street, :city, :zip_code)
	end
	
end