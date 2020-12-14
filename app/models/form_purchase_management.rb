class FormPurchaseManagement
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, 
                :building_name, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,format: { with: /\A\d{3}-\d{4}\z/, message: 'code Input correctly' }
    validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
    validates :municipality
    validates :address
    validates :phone_num, format: { with: /\A\d{11}\z/, message: 'Input only number' }
  end

  def save
    @purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                    address: address, building_name: building_name, phone_num: phone_num, purchase_management_id: @purchase_management.id)
  end
end