FactoryGirl.define do
  factory :event do
    name "John"
    description  "Doe"
    owner_id 3
    datetime Time.now
    association :room, factory: :room
    association :owner, factory: :user
  end
end
