
FactoryGirl.define do
  factory :report, :class => Refinery::Reports::Report do
    sequence(:authors) { |n| "refinery#{n}" }
  end
end

