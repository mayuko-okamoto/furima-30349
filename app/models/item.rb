class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :detail
    validates :price,         inclusion: { in: 300..9999999 }
    validates :category_id
    validates :condition_id
    validates :shipping_payer_id
    validates :prefecture_id
    validates :storage_date_id
  end

  belongs_to :user
  has_one :purchase_record

end
