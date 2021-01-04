class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,            presence: true
  validates :email,               presence: true, uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,100}\z/
  validates :password,            presence: true,format: { with: VALID_PASSWORD_REGEX }
  validates :first_name,          presence: true
  validates :last_name,           presence: true
  validates :first_name_kana,     presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :last_name_kana,      presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :birth_date,          presence: true

  has_many :items
  has_many :purchase_records
  
end