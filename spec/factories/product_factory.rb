FactoryBot.define do
  sequence :name do |n|
    "Bike_#{n}"
  end
  factory :product do
    name
    description {"This is the description of this product"}
  end
end
