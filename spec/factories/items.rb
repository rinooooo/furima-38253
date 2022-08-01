FactoryBot.define do
  factory :item do
    name                 { Faker::Name.name }
    description          { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    condition_id         { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id   { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id     { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id      { Faker::Number.between(from: 2, to: 4) }
    item_price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    image { Rack::Test::UploadedFile.new('spec/fixtures/hero.jpg', 'image/jpg') }
  end
end
