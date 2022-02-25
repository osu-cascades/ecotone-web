FactoryBot.define do
  factory :plot do
    plot_id { 1 }
    featured_plant
    latitude { 44.0582 }
    longitude { 121.3153 }
    elevation { 3623 }
    area { 100 }
    location_description { 'south wall of Tykeson Hall.' }
    aspect { 'North' }
    origin { 'Salvage' }
    inoculated { true }
    initial_planting_date { 'Spring, 2017' }
    initial_succession { 'Nudation' }
  end

  factory :invalid_plot, parent: :plot do |f|
    f.plot_id { nil }
  end
end
