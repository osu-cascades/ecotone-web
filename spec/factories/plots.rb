FactoryGirl.define do
  factory :plot do
      plot_id 1
      latitude 44.0582
      longitude 121.3153
      elevation 3623
      area 100
      location_description "South wall of Tykson Hall"
      aspect "North"
      origin "Salvage"
      inoculated true
      initial_planting_date "Spring, 2017"
      initial_succession "Nudation"
      photo "https://example@aws.com"
  end
end
