class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:account_update) << :first
	    devise_parameter_sanitizer.for(:account_update) << :last
	   	devise_parameter_sanitizer.for(:account_update) << :address
	   	devise_parameter_sanitizer.for(:account_update) << :city
	   	devise_parameter_sanitizer.for(:account_update) << :state
	   	devise_parameter_sanitizer.for(:account_update) << :zipcode
	   	devise_parameter_sanitizer.for(:account_update) << :title
	   	devise_parameter_sanitizer.for(:account_update) << :contract_date
	   	devise_parameter_sanitizer.for(:account_update) << :b_day
	   	devise_parameter_sanitizer.for(:account_update) << :h_phone
	   	devise_parameter_sanitizer.for(:account_update) << :c_phone
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,:password_confirmation, :first, :last, :address, :city, :state, :zipcode, :title, :contract_date, :b_day, :h_phone, :c_phone) }
	end

end
