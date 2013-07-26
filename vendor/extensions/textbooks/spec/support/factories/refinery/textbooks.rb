
FactoryGirl.define do
  factory :textbook, :class => Refinery::Textbooks::Textbook do
    sequence(:authors) { |n| "refinery#{n}" }
  end
end

