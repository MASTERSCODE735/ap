# frozen_string_literal: true

class AddOtpFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp_secret, :string
    add_column :users, :otp_sent_at, :datetime
    add_column :users, :otp_verified_at, :datetime
  end
end
