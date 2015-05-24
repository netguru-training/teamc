FactoryGirl.define do
  factory :user do
    name "John"
    age 20
    email { FFaker::Internet.email }
    password  "changeme"
  end
end
