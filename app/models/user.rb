class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits
  has_many :items
  has_many :orders

  # items a user wants
  has_many :desired_items, through: :orders
  # items a user has offered
  has_many :offered_items, through: :orders

  has_one_attached :photo

  validates :nickname, presence: true
end
