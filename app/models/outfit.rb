class Outfit < ApplicationRecord
  belongs_to :user

  has_many :item_outfit
  has_many :items, through: item_outfit
end
