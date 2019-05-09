FactoryBot.define do
  factory :nutrient do
    name { 'fake' }
    level { 'low' }
    amount { 1.5 }
    soil_sample

    trait :without_level do
      level { nil }
    end

    trait :without_amount do
      amount { nil }
    end

    trait :without_level_or_amount do
      level { nil }
      amount { nil }
    end
  end

end
