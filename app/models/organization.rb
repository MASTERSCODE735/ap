class Organization < ApplicationRecord
  # Attributes: id, name, timezone, currency

  has_many :users

  validates :name, presence: true, uniqueness: true
end
