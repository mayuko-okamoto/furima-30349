class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone
  
  with_options presence: true do
    validates :postal_code,
              format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンが必要です。' }
    validates :prefecture_id
    validates :city
    validates :lot_number
    validates :phone, 
              format: { with: /\A[0-9]{,8}+\z/, message: 'は11桁以下の半角数字で入力して下さい。' }
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end


| Column          | Type       | Options                                    |
|-----------------|------------|--------------------------------------------|
| postal_code     | string     | null: false,format: { with: /\A[0-9]+\z/ } |
| prefecture_id   | integer    | null: false                                |
| city            | string     | null: false                                |
| lot_number      | string     | null: false                                |
| building_name   | string     |                                            |
| phone           | string     | null: false,format: { with: /\A[0-9]+\z/ } |