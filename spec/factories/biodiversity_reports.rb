FactoryBot.define do
  factory :biodiversity_report, class: 'BiodiversityReport' do
    measured_on { Date.today }
    measured_at { Date.today }
    temperature { 1.5 }
    species_richness { 1 }
    diversity_index { 1.5 }
    species_evenness { 0.5 }
    biomass_estimate { 1.0 }
    plot
    author factory: :user
  end
end
