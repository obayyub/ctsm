
FactoryGirl.define do
  factory :course, :class => Refinery::Courses::Course do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

