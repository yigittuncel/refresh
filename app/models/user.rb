class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # items a user wants
  has_many :desired_items, through: :orders
  # items a user has offered
  has_many :offered_items, through: :orders

  has_one_attached :photo
end
