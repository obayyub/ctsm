
FactoryGirl.define do
  factory :ctsm_home, :class => Refinery::CtsmHomes::CtsmHome do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

