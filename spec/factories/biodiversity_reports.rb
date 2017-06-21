FactoryGirl.define do
  factory :biodiversity_report do
    date Date.today
    time Date.today
    temperature 1.5
    biomass_estimate 1.5
    species_richness 1
    photo ""
    plot
    user
  end
end
