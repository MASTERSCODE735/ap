class Section < ApplicationRecord
  belongs_to :unit
  has_many :phrases, -> {order(:position)}, dependent: :destroy
  has_many :activities, -> {order(:position)}, dependent: :destroy
end
