class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,100}\z/.freeze
    validates :password,            format: { with: VALID_PASSWORD_REGEX }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力して下さい。' }
    validates :last_name,           format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力して下さい。' }
    validates :first_name_kana,     format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'は全角カタカナで入力して下さい。' }
    validates :last_name_kana,      format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'は全角カタカナで入力して下さい。' }
    validates :birth_date
  end

  has_many :items
  has_many :orders
end
