FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    kanji_first_name { Faker::Name.first_name }
    kanji_family_name { Faker::Name.last_name }
    kana_first_name { Faker::Name.first_name }
    kana_family_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
