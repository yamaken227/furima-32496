class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :fee_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
end
