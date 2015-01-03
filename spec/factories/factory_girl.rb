require 'factory_girl'

FactoryGirl.define do
  factory :manufacturer do
    name "Ford"
    country "USA"
  end

  factory :car do
    manufacturer "Ford"
    color 'Green'
    year '1993'
    mileage '19324'
  end
end
