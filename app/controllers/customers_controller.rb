class CustomersController < ApplicationController
	before_action :logged_in_customer, only: [:destroy]

	def index
		@books = Book.all
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			session[:customer_id] = @customer.id
			flash[:notice] = 'Success! You created an account.'
			redirect_to '/mydashboard'
		else
			render :new
		end
	end

	def show
		
	end

	def destroy
		Customer.find(params[:id]).destroy
	end

	private

	def customer_params
		params.require(:customer).permit(:name, :email, :password, :password_confirmation)
	end

end