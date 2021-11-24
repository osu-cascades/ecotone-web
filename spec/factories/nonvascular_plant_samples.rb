FactoryBot.define do
  factory :nonvascular_plant_sample do
    collected_on { Date.today }
    plot
    location_within_plot { 'on a twig' }
    description { 'description of a nonvascular plant' }
    user
  end

  factory :invalid_nonvascular_plant_sample, parent: :nonvascular_plant_sample do |f|
    f.description { nil }
  end
end
