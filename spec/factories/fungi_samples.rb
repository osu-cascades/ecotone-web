FactoryGirl.define do
  factory :fungi_sample do
    location_within_plot "on a rock"
    size 1.5
    description "description of fungi sample"
    photo ""
    biodiversity_report
  end
end
