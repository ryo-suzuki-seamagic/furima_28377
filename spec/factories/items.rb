FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    kategory_id                { Faker::Number.within(range: 2..11) }
    status_id                  { Faker::Number.within(range: 2..7) }
    delivery_fee_id             { Faker::Number.within(range: 2..3) }
    from_id                     { Faker::Number.within(range: 2..48) }
    day_id                      { Faker::Number.within(range: 2..4) }
    price                       { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
