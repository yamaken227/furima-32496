FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials }
    explanation      { 'あいう' }
    category_id      { 2 }
    status_id        { 2 }
    fee_burden_id    { 2 }
    prefecture_id    { 2 }
    days_to_ship_id  { 2 }
    price            { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
