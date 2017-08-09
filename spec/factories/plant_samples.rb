FactoryGirl.define do
  factory :plant_sample do
    abundance 1
    percent_cover 1
    photo ''
    plant
    biodiversity_report
  end

  factory :empty_plant_sample, class: PlantSample do
    abundance ''
    percent_cover ''
    photo ''
    plant nil
    biodiversity_report nil
  end
end
