class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :price,         
      inclusion: { in: 300..9999999 },
      format: { with: /^[0-9]+$/, message: 'は半角数字で入力して下さい。' }
    validates :category_id
    validates :condition_id
    validates :shipping_payer_id
    validates :prefecture_id
    validates :storage_date_id
  end

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

 
  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :condition_id
    validates :shipping_payer_id
    validates :prefecture_id
    validates :storage_date_id

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :storage_date

end
