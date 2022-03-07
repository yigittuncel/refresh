class Order < ApplicationRecord
  belongs_to :buyer, foreign_key: :buyer_id, class_name: 'User'
  belongs_to :seller, foreign_key: :seller_id, class_name: 'User'

  enum status: [:pending, :confirmed, :rejected]

  belongs_to :desired_item, foreign_key: :desired_item_id, class_name: 'Item'
  belongs_to :offered_item, foreign_key: :offered_item_id, class_name: 'Item'

  has_one :chatroom
end
