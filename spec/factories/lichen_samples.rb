FactoryGirl.define do
  factory :lichen_sample do
    plot { biodiversity_report.plot }
    user { biodiversity_report.author }
    collected_on Date.today
    location_within_plot 'on a twig'
    description 'description of a lichen'
    photo ''
    biodiversity_report
  end

  factory :empty_lichen_sample, class: LichenSample do
    collected_on nil
    location_within_plot ''
    description ''
    photo ''
    biodiversity_report nil
  end
end
