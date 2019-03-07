FactoryBot.define do

  factory :comment do
    rating { rand(1..5) }
  end

end
