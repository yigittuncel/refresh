class Item < ApplicationRecord
  belongs_to :user

  has_many :receiving_orders, foreign_key: "desired_item_id", class_name: 'Orders'
  has_many :offering_orders, foreign_key: "offered_item_id", class_name: 'Orders'

  has_many :item_outfits
  has_many :outfits, through: :item_outfits

  has_one_attached :photo

end
