FactoryGirl.define do
  factory :checkin do
    user_id { Faker::Number.between(1, 100) }
    place_id { Faker::Number.between(1, 100) }
    date_attended { Faker::Date.backward(365) }
    image_url { Faker::Avatar.image }
    description { Faker::Lorem.sentence }
  end
end