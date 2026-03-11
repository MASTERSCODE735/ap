class Phrase < ApplicationRecord
  belongs_to :section
  has_one_attached :audio
end
