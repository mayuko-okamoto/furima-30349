require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'image, title, detail, price, category_id, condition_id, shipping_payer_id, prefecture_id, storage_date_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300~¥9,999,999の間であれば出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
      it '販売価格は半角数字であれば出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleがないと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'detailがないと出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'priceがないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idがないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_payer_idがないと出品できない' do
        @item.shipping_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping payer can't be blank")
      end
      it 'prefecture_idがないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'storage_date_idがないと出品できない' do
        @item.storage_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Storage date can't be blank")
      end
    end
  end
end
