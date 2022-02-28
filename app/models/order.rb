class Order < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :confirmed, :rejected]

  belongs_to :desired_item, foreign_key: :desired_item_id, class_name: 'Item'
  belongs_to :offered_item, foreign_key: :offered_item_id, class_name: 'Item'
end
