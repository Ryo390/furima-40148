FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    birthday              { Faker::Date.birthday }
    last_name_zen         { "翔平" }
    first_name_zen        { "大谷" }
    last_name_kana        { "ショウヘイ" }
    first_name_kana       { "オオタニ" }
  end
end