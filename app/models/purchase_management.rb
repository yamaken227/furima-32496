class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase
  accepts_nested_attributes_for :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
