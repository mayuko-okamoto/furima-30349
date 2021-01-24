class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンが必要です。' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :lot_number
    validates :phone, format: { with: /\A[0-9]{,11}+\z/, message: 'は11桁以下の半角数字で入力して下さい。' }
  end

  belongs_to :order
end

