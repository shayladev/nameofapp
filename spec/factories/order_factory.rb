FactoryBot.define do

  sequence :id do |n|
    "#{n+3}"
  end

  factory :order do
    id
    association :product
    total { 1399.99 }
  end

end
