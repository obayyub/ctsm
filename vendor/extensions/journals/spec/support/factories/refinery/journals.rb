
FactoryGirl.define do
  factory :journal, :class => Refinery::Journals::Journal do
    sequence(:authors) { |n| "refinery#{n}" }
  end
end

