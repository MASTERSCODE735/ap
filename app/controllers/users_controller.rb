class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to expenses_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def otp_login
    @user = User.find_by(mobile: params[:mobile])
    if @user
      otp = @user.generate_otp
      UserMailer.send_otp(@user, otp).deliver_now
      flash[:notice] = 'OTP sent to your email.'
      redirect_to verify_otp_users_path(mobile: @user.mobile)
    else
      flash[:alert] = 'Mobile number not found.'
      redirect_to root_path
    end
  end

  def verify_otp
    @user = User.find_by(mobile: params[:mobile])
    if @user && @user.verify_otp(params[:otp])
      sign_in(@user)
      redirect_to expenses_path, notice: 'Logged in successfully.'
    else
      flash[:alert] = 'Invalid OTP.'
      render :otp_login
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
