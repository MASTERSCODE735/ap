class User < ApplicationRecord

  attr_accessor :otp
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Attributes: id, email, mobile, name, role, org_id, avatar_url
  # id is automatically created as primary key

  belongs_to :organization, foreign_key: :org_id, optional: true

  validates :email, presence: true, uniqueness: true
  validates :mobile, presence: true, allow_blank: true
  validates :name, presence: true, allow_blank: true
  validates :role, presence: true, allow_blank: true
  validates :org_id, presence: true, allow_blank: true
  validates :avatar_url, presence: true, allow_blank: true

  # OTP logic
  def generate_otp
    self.otp_secret = ROTP::Base32.random_base32
    totp = ROTP::TOTP.new(otp_secret)
    otp = totp.now
    self.otp_sent_at = Time.current
    save!
    otp
  end

  def verify_otp(code)
    return false if otp_secret.blank? || otp_sent_at.blank?
    totp = ROTP::TOTP.new(otp_secret)
    if totp.verify(code, drift_behind: 300)
      self.otp_verified_at = Time.current
      save!
      true
    else
      false
    end
  end
end
