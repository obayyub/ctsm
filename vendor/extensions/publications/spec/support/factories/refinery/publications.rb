
FactoryGirl.define do
  factory :publication, :class => Refinery::Publications::Publication do
    sequence(:category) { |n| "refinery#{n}" }
  end
end

