require 'rails_helper'

RSpec.describe FormPurchaseManagement, type: :model do
  describe '商品購入' do
    before do
      @form_purchase_management = FactoryBot.build(:form_purchase_management)
    end
    context '商品が購入できる時' do
      it 'postal_code,prefecture_id,municipality,address,
      phone_num,purchase_management,tokenがあれば購入できる' do
        expect(@form_purchase_management).to be_valid
      end
      it 'postal_codeにハイフンがあれば購入できる' do
        @form_purchase_management.postal_code = "111-1111"
        expect(@form_purchase_management).to be_valid
      end
      it 'prefecture_idが1以外なら購入できる' do
        @form_purchase_management.prefecture_id = 2
        expect(@form_purchase_management).to be_valid
      end
      it 'phone_numが11桁の数字なら購入できる' do
        @form_purchase_management.phone_num = '12121212121'
        expect(@form_purchase_management).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'postal_codeが空だと購入できない' do
        @form_purchase_management.postal_code = nil
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @form_purchase_management.postal_code = '1111111'
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Postal code code Input correctly")
      end
      it 'postal_codeは×××-××××の形でないと購入できない' do
        @form_purchase_management.postal_code = '11-11111'
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Postal code code Input correctly")
      end
      it 'prefecture_idが1だと購入できない' do
        @form_purchase_management.prefecture_id = 1
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Prefecture Select")
      end
      it 'municipalityが空だと購入できない' do
        @form_purchase_management.municipality = nil
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @form_purchase_management.address = nil
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと購入できない' do
        @form_purchase_management.phone_num = nil
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numに文字が入っていると購入できない' do
        @form_purchase_management.phone_num = 'あ1111111111'
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Phone num Input only number")
      end
      it 'phone_numが12桁以上だと購入できない' do
        @form_purchase_management.phone_num = '111111111111'
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Phone num Input only number")
      end
      it 'tokenが空だと購入できない' do
        @form_purchase_management.token = nil
        @form_purchase_management.valid?
        expect(@form_purchase_management.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
