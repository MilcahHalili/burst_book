class DeliveriesController < ApplicationController

	def new
		@delivery = Delivery.new
	end

	def create
		@delivery = Delivery.new(delivery_params)
		redirect_to '/payment'
		# p '$' * 100
		# p params 
		# p '$' * 100
		# if @delivery.save 
		# 	redirect_to confirmation_order_path(@order)
		# else
		# 	p '*' * 100
		# 	p @order.errors
		# 	p '*' * 100
		# 	redirect_back
		# end
	end

	private

	def delivery_params
		params.require(:delivery).permit(:name, :street, :city, :zip_code, :specialinstructions)
	end
	
end