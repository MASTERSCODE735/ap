class Unit < ApplicationRecord
  has_many :sections, -> {order(:position)}, dependent: :destroy
end
