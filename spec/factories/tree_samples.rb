FactoryBot.define do
  factory :tree_sample do
    collected_on { Date.today }
    plot
    plant
    user
    tag_number { 1 }
    growth_stage { 'seedling' }
    dbh { 1.5 }
    lower_canopy_height { 1.5 }
    upper_canopy_height { 1.5 }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
