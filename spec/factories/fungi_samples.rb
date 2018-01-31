FactoryGirl.define do
  factory :fungi_sample do
    collected_on Date.today
    user
    plot
    location_within_plot 'on a rock'
    size 1.5
    description 'description of fungi sample'
    photo ''
  end

  factory :empty_fungi_sample, class: FungiSample do
    collected_on nil
    location_within_plot ''
    size ''
    description ''
    photo ''
  end
end
