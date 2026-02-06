class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:send_otp]
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      # Standard Devise login
      sign_in(user)
      redirect_to expenses_path
    elsif user && params[:user][:otp].present?
      if user.verify_otp(params[:user][:otp])
        sign_in(user)
        redirect_to expenses_path
      else
        flash[:alert] = 'Invalid OTP.'
        redirect_to new_user_session_path
      end
    else
      flash[:alert] = 'Invalid email or password.'
      redirect_to new_user_session_path
    end
  end

  def send_otp
    user = User.find_by(email: params[:user][:email])
    if user
      otp = user.generate_otp
      UserMailer.send_otp(user, otp).deliver_now
      flash[:notice] = 'OTP sent to your email.'
    else
      flash[:alert] = 'Email not found.'
    end
    redirect_to new_user_session_path(email: params[:user][:email])
  end
end
