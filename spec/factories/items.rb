FactoryBot.define do
  factory :item do
    name                 { Faker::Name.name }
    description          { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    condition_id         { Faker::Number.between(from: 2, to: 8) }
    delivery_charge_id   { Faker::Number.between(from: 2, to: 48) }
    delivery_area_id     { Faker::Number.between(from: 2, to: 3) }
    delivery_day_id      { Faker::Number.between(from: 2, to: 4) }
    item_price           { Faker::Number.between(from: 300, to: 9999999) }
    association :user

  end
end
