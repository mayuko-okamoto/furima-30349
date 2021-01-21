class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone
  
  with_options presence: true do
    validates :postal_code,
              numericality: { only_integer: true,  },
              format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。' }
    validates :prefecture_id
    validates :city, 
              numericality: { only_integer: true,  },
              format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。' }
    validates :lot_number, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
    validates :phone, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
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