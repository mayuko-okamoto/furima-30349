require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "0000abcd", password_confirmation: "0000abcd", first_name: "あ", last_name: "あ", first_name_kana: "ア", last_name_kana: "ア", birth_date: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "あ", email: "", password: "0000abcd", password_confirmation: "0000abcd", first_name: "あ", last_name: "あ", first_name_kana: "ア", last_name_kana: "ア", birth_date: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end