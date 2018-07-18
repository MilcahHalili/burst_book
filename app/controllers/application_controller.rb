class ApplicationController < ActionController::Base

  private

  helper_method :current_customer
  helper_method :current_order

  def current_customer
		@current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
  end

  def authorize
		redirect_to login_path, alert: 'Please sign in.' if current_customer.nil?
  end

end
