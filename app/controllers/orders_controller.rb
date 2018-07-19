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
		@order.paid = true
		redirect_to '/confirmation'
	end

	def show
		if params[:id] == 'cart'
			order = current_customer.cart(current_customer)
			@line_items = order.map { |order| order.line_items }
		else
			@order = Order.find(params[:id])
		end
	end

	def destroy
		if @order.paid == true
			@line_items.destroy
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :street, :city, :state, :zip_code, :special_instructions)
	end
	
end