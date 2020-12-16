class PurchaseManagement < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
