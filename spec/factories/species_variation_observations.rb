FactoryBot.define do
  factory :species_variation_observation do
    observed_on { Date.today }
    user
    plot
    plant
    average_height { 1.5 }
    average_width { 1.5 }
    description { 'Fake description' }
  end
end
