FactoryBot.define do
  sequence :email do |n|
    "user-#{n}@example.com"
  end
  sequence :first_name do |n|
    "user-#{n}"
  end

  factory :user do
    email
    password { "password" }
    first_name
    last_name { "lastname" }
    admin { false }
  end

end
