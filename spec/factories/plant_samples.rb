FactoryGirl.define do
  factory :plant_sample do
    collected_on Date.today
    abundance 1
    percent_cover 1
    photo ''
    plant
    plot { biodiversity_report.plot }
    user { biodiversity_report.author }
    biodiversity_report
  end

  factory :empty_plant_sample, class: PlantSample do
    collected_on nil
    abundance ''
    percent_cover ''
    photo ''
    plant nil
    plot nil
    user nil
    biodiversity_report nil
  end
end
