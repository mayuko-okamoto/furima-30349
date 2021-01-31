require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '配送先の住所情報の保存' do

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'nameが空だと保存できないこと' do
    end
    it 'nameが全角日本語でないと保存できないこと' do
    end
    it 'name_readingが空だと保存できないこと' do
    end
    it 'name_readingが全角日本語でないと保存できないこと' do
    end
    it 'nicknameが空だと保存できないこと' do
    end
    it 'nicknameが半角でないと保存できないこと' do
    end
    it 'postal_codeが空だと保存できないこと' do
    end
  end
end