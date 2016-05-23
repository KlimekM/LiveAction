FactoryGirl.define do
  factory :place do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    capacity { Faker::Number.number(5) }
    date_opened { Faker::Date.backward(2000) }
    image_url { Faker::Avatar.image }

    factory :place_with_checkin do
      after(:create) do |place|
        create(:checkin, place: place)
      end
    end
  end

end