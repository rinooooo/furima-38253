FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { person.first }
    last_name             { person.last }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: 5.year.from_now) }
  end
end
