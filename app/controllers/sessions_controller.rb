class SessionsController < ApplicationController

	def new
	end

	def create
		customer = Customer.find_by(email: params[:email])
		if customer && customer.authenticate(params[:password])
			session[:customer_id] = customer.id
			redirect_to new_book_path
		else
			flash.now.alert = 'Invalid login credentials. Please try again!'
			render :new
		end
	end

	def destroy
		session[:customer_id] = nil
		redirect_to root_path
	end
	
end