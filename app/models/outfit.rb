class Outfit < ApplicationRecord
  belongs_to :user

  has_many :item_outfits
  has_many :items, through: :item_outfits
end
