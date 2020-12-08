class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  has_one_attached :image
end
