FactoryGirl.define do
  factory :nonvascular_plant_sample do
    collected_on Date.today
    plot
    location_within_plot 'on a twig'
    description 'description of a nonvascular plant'
    photo ''
    user
  end
end
