FactoryBot.define do
  factory :purchase_address do
    postal_code                    {"000-0000"}
    prefecure_id                   {Faker::Number.within(range: 2..48) }
    muncipalities                  {"テスト市テスト町"}
    address                        {"12-34"}
    building_name                  {"テストマンション"}
    phone_number                   {"09012345678"}

  end
end
