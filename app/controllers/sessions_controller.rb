class SessionsController < ApplicationController

	def new
	end

	def create
		customer = Customer.find_by(email: params[:email])
		if customer && customer.authenticate(params[:password])
			session[:customer_id] = customer.id
			redirect_to '/dashboard'
		else
			flash.now.alert = 'Invalid login credentials. Please try again!'
			render :new
		end
	end

	def destroy
		session[:customer_id] = nil
		redirect_to root_path, notice: "You're logged out. Enjoy your day!"
	end
	
end