
FactoryGirl.define do
  factory :carousel, :class => Refinery::Carousels::Carousel do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

