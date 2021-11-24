FactoryBot.define do
  factory :mycorrhizal_fungi_sample do
    collected_on { Date.today }
    length { 1 }
    magnification { 4 }
    vesicle_count { 100 }
    arbuscule_count { 0 }
    visible_hyphae { true }
    hyphae_coverage { 10 }
    user
    plot
    plant

    trait :without_visible_hyphae do
      visible_hyphae { false }
      hyphae_coverage { nil }
    end

    factory :invalid_mycorrhizal_fungi_sample, parent: :mycorrhizal_fungi_sample do |f|
      f.length { -2 }
    end
  end
end
