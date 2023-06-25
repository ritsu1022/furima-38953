FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.sentence }
    explanation     { Faker::Lorem.sentence }
    category_id     { 2 }
    condition_id    { 2 }
    shipping_fee_id { 2 }
    region_id       { 2 }
    lead_time_id    { 2 }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
