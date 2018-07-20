class OrdersController < ApplicationController
	before_action :authorize
	
	def index
		@orders = current_customer.orders.order(updated_at: :desc)
	end

	def new
		@order = Order.new
	end
	
	def show
		if params[:id] == 'cart'
			@order = current_customer.cart
		else
			@order = Order.find(params[:id])
		end
	end
	
	def checkout
		cart = current_customer.cart
		cart.update_attributes(order_params)
		cart.paid = true
		cart.save
		redirect_to confirmation_path
	end

	def confirmation
		@order = Order.first
	end

	private

	def order_params
		params.require(:order).permit(:name, :street, :city, :state, :zip_code, :special_instructions)
	end
	
end

