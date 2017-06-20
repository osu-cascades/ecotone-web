FactoryGirl.define do
  factory :biodiversity_report do
    date "2017-06-07"
    time "2017-06-07 09:37:09"
    temperature 1.5
    biomass_estimate 1.5
    species_richness 1
    photo ""
    plot
    user
  end
end
