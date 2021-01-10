FactoryBot.define do
  factory :item do

    title                 { Faker::Lorem.characters(40) }
    detail                { Faker::Lorem.sentence }
    price                 { Faker::Number.between(from: 300, to: 9999999) }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_payer_id     { 2 }
    prefecture_id         { 2 }
    storage_date_id       { 2 }
    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

