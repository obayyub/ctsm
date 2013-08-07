
FactoryGirl.define do
  factory :about, :class => Refinery::Abouts::About do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

