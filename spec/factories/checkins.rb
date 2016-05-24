FactoryGirl.define do
  factory :checkin do
    user
    place
    date_attended { Faker::Date.backward(365) }
    image_url { Faker::Avatar.image }
    description { Faker::Lorem.sentence }
  end
end