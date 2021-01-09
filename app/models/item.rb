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
  has_one_attached :image


  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_payer_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :storage_date_id, numericality: { other_than: 1 } 

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :storage_date

end
