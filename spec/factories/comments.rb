FactoryGirl.define do
  factory :comment do
    commenter
    text { Faker::Hipster.sentence }
  end
end