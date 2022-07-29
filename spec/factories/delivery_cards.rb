FactoryBot.define do
  factory :delivery_card do
    post_code            { '111-1111' }
    delivery_area_id     { Faker::Number.between(from: 2, to: 48) }
    town                 { Faker::Address.city }
    address              { Faker::Address.street_address }
    house_name           { Faker::Lorem.word }
    phone_number         { Faker::Number.number(digits: 10) }
    token                { 'tok_abcdefghijk00000000000000000' }
    user_id              { Faker::Number }
    item_id              { Faker::Number }
  end
end
