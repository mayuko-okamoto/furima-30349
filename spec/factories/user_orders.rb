FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    lot_number { '1-1' }
    building_name { '渋谷ビル' }
    phone { '09012345678' }
    order_id { 1 }
    user_id { 1 }
    item_id { 1 }
  end
end

