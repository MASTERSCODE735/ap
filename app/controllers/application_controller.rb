class ApplicationController < ActionController::Base
	# Ensure Devise helpers are available in all views/layouts
	helper_method :user_signed_in?, :current_user

	protected

	def after_sign_in_path_for(resource)
		units_path
	end
end
