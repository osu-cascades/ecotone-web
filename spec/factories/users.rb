FactoryGirl.define do
  factory :user do
    name 'Example Valid User'
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'

    trait :admin do
      admin true
    end

    trait :resetting_password do
      after(:build) { |u| u.create_reset_digest }
    end
  end
end
