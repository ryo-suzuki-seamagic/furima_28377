FactoryBot.define do
  factory :user do
    nickname                                {Faker::Name.initials}
    email                                   {Faker::Internet.free_email}
    password                                {"pass0000"}
    password_confirmation                   {password}
    birthday                                {Faker::Date.birthday}
    first_name                               {"鈴木"}
    last_name                                {"諒"}
    first_name_kana                          {"スズキ"}
    last_name_kana                           {"リョウ"}
  end
end