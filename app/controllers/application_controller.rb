#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	private
	def log s
		logger.debug "(´・ω・｀)#{s}"
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone,:begin_employment])
	end
end
