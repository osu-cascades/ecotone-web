FactoryBot.define do
  factory :lichen_sample do
    plot
    user
    collected_on { Date.today }
    location_within_plot { 'on a twig' }
    description { 'description of a lichen' }
  end

  factory :empty_lichen_sample, class: LichenSample do
    collected_on { nil }
    location_within_plot { '' }
    description { '' }
  end

  factory :invalid_lichen_sample, parent: :lichen_sample do |f|
    f.description { nil }
  end
end
