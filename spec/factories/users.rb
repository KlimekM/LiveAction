FactoryGirl.define do
  factory :user, aliases: [:commenter] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    image_url { Faker::Avatar.image }
  end
end