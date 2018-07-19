class OrdersController < ApplicationController

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
		current_customer.cart.update_attributes(order_params)
		current_customer.cart.paid = true
		current_customer.cart.save
		redirect_to '/confirmation'
	end

	def destroy
		@orderid = Order.find(params[:id])
		if @orderid.paid?
			redirect_to '/confirmation'
		else
			redirect_to request.env["HTTP_REFERER"]
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :street, :city, :state, :zip_code, :special_instructions)
	end
	
end

