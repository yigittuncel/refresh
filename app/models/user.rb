class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits, dependent: :destroy
  has_many :items, dependent: :destroy
  # has_many :orders, dependent: :destroy

  # items a user wants
  has_many :desired_items, through: :offering_orders
  # items a user has offered
  has_many :offered_items, through: :receiving_orders

  has_one_attached :photo

  has_many :receiving_orders, foreign_key: "seller_id", class_name: 'Orders'
  has_many :offering_orders, foreign_key: "buyer_id", class_name: 'Orders'

  validates :nickname, uniqueness: true
  validates :email, uniqueness: true
end
