class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: ' Out of setting range'
  }
  validates :price, numericality: {
    with: /\A[0-9]+\z/, message: 'Half-width number'
  }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
