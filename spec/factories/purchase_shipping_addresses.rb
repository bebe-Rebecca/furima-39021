FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '123-4567' }
    origin_to_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '国立市中' }
    address_number { '1-2' }
    building_name { '柳ビル' }
    phone_number{ '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
