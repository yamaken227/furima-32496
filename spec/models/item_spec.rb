require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '出品成功時' do
      it 'nameとexplanation、category_id、status_id、fee_burden_id、prefecture_id
      days_to_ship_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category_idが1以外なら登録できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'status_idが1以外なら登録できる' do
        @item.status_id = '2'
        expect(@item).to be_valid
      end
      it 'fee_burden_idが1以外なら登録できる' do
        @item.fee_burden_id = '2'
        expect(@item).to be_valid
      end
      it 'prefecture_idが1以外なら登録できる' do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end
      it 'days_to_ship_idが1以外なら登録できる' do
        @item.days_to_ship_id = '2'
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間なら登録できる' do
        @item.price = '30000'
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら' do
        @item.price = '30000'
        expect(@item).to be_valid
      end
    end
    context 'エラー発生時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'status_idが1だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it 'fee_burden_idが1だと登録できない' do
        @item.fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden Select")
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship Select")
      end
      it 'priceが300~9999999の間以外は登録できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  Out of setting range")
      end
    end
  end
end

