FactoryBot.define do
  factory :item do
    item_name         { Faker::Commerce.product_name }
    price             { Faker::Commerce.price(range: 300..9_999_999, as_string: false).to_i }
    description_item  { Faker::Lorem.sentence }
    category_id       { 2 }
    item_condition_id { 2 }
    prefecture_id     { Faker::Number.between(from: 1, to: 47) }
    postage_id        { 2 }
    delivery_date_id  { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
