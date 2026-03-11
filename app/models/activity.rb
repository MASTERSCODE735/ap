class Activity < ApplicationRecord
  belongs_to :section
  has_many :activity_items, -> {order(:position)}, dependent: :destroy  
end
