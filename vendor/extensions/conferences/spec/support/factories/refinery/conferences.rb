
FactoryGirl.define do
  factory :conference, :class => Refinery::Conferences::Conference do
    sequence(:author) { |n| "refinery#{n}" }
  end
end

