class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンが必要です。' }
    validates :prefecture_id
    validates :city
    validates :lot_number
    validates :phone
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :phone, length: { maximum: 11 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building_name: building_name, phone: phone, order_id: order.id)
  end
end


