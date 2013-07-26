
FactoryGirl.define do
  factory :person, :class => Refinery::People::Person do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

