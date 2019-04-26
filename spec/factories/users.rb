FactoryGirl.define do
  factory :user do
    name 'Example Valid User'
    email 'example@example.com'
    password 'password'

    trait :admin do
      admin true
    end
  end
end
