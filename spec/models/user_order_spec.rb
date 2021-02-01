require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '配送先の住所情報の保存' do
    context '配送先の住所情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@user_order).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @user_order.building_name = ''
        expect(@user_order).to be_valid
      end
    end

    context '配送先の住所情報が保存できない場合' do
      it '郵便番号がないと保存できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code はハイフンが必要です。')
      end
      it 'prefecture_idがないと出品できない' do
        @user_order.prefecture_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では出品できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityがないと出品できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it 'lot_numberがないと出品できない' do
        @user_order.lot_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Lot number can't be blank")
      end
      it '電話番号がないと保存できない' do
        @user_order.phone = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が12桁以上だと保存できない' do
        @user_order.phone = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it '電話番号が全角では保存できない' do
        @user_order.phone = '０９０１１１１１１１１'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone は半角数字で入力して下さい。")
      end
      it '電話番号にハイフンが入力されている場合は保存できない' do
        @user_order.phone = '090-1111-1111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone は半角数字で入力して下さい。")
      end
      it '電話番号に数字以外の文字が入力されている場合は保存できない' do
        @user_order.phone = 'aiueo'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone は半角数字で入力して下さい。")
      end
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
      
  end
end