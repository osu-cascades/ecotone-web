FactoryGirl.define do
  factory :user do
    name "Regular User"
    email "regular@example.com"
    #password_digest: { User.digest('password') }

    trait :admin do
      admin true
    end
  end
end