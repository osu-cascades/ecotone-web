FactoryGirl.define do
  factory :biodiversity_report do
    measured_on Date.today
    measured_at Date.today
    temperature 1.5
    biomass_estimate 1.5
    species_richness 1
    photo ""
    plot
    author factory: :user
  end
end
