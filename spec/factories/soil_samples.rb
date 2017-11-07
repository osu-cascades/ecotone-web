FactoryGirl.define do
  factory :soil_sample do
    ph_level 1.5
    temperature 20.5
    moisture 3.5
    collection_method 'composite'
    biodiversity_report
  end

  factory :empty_soil_sample, class: SoilSample do
    ph_level ''
    temperature ''
    moisture ''
    collection_method ''
    biodiversity_report nil
  end
end
