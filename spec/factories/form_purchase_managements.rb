FactoryBot.define do
  factory :form_purchase_management do
    postal_code    {'111-2222'}
    prefecture_id  { 2 }
    municipality   {'テスト市ほげ区'}
    address        {'2番地15丁目'}
    building_name  {'テストハイツ201'}
    phone_num      {'12312312312'}
  end
end
