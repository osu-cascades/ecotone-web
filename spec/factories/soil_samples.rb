FactoryGirl.define do
  factory :soil_sample do
    ph_level 1.5
    temperature 20.5
    moisture 3.5
    biodiversity_report
  end

  factory :empty_soil_sample, class: SoilSample do
    ph_level ''
    temperature ''
    moisture ''
    biodiversity_report nil
  end
end
