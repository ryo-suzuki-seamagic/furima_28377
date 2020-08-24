FactoryBot.define do
  factory :item do
    image                           {Faker::Lorem.sentens}
    title                           {Faker::title}
    text                            {Faker::text}
    kategory_id                     {Faker::number::(2-11)}
    status_id                       {Faker::number::(2-7)}
    delivery_fee_id                 {Faker::number::(2-3)}
    from_id                         {Faker::number::(2-48)}
    day_id                          {Faker::number::(2-4)}
    price                           {Faker::number::(300-9999999)}
    association :user

  end
end
