class UserMailer < ApplicationMailer
  def send_otp(user, otp)
    @otp = otp
    mail(to: user.email, subject: 'Your OTP Code')
  end
end
