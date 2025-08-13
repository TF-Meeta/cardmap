class CardPost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :store_name, :card_name, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
