FactoryBot.define do
  factory :macroinvertebrate_sample do
    collected_on { Date.today }
    plot
    user
    phylum { 'Arthropoda' }
    location_within_plot { 'on a rock' }
    quantity { 1 }
    ecosystem_service { 'Pollinator' }
  end

  factory :empty_macroinvertebrate_sample, class: MacroinvertebrateSample do
    collected_on { nil }
    phylum { '' }
    location_within_plot { '' }
    quantity { '' }
    ecosystem_service { '' }
  end

  factory :invalid_macroinvertebrate_sample, parent: :macroinvertebrate_sample do |f|
    f.quantity { -2 }
  end
end
