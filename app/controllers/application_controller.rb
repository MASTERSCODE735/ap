class ApplicationController < ActionController::Base
	# Ensure Devise helpers are available in all views/layouts
	helper_method :user_signed_in?, :current_user
end
