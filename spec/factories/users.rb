FactoryBot.define do
  factory :user do
    name { 'Example Valid User' }
    email { 'example@example.com' }
    password { 'password' }

    trait :admin do
      admin { true }
    end

    trait :alternate do
      name { 'Another Example Valid User' }
      email { 'another_example@example.com' }
    end
  end
end
