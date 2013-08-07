
FactoryGirl.define do
  factory :visitor, :class => Refinery::Visitors::Visitor do
    sequence(:parking) { |n| "refinery#{n}" }
  end
end

