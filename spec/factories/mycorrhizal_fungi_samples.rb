FactoryGirl.define do
  factory :mycorrhizal_fungi_sample do
    collected_on "2018-01-28"
    length 1
    magnification 1
    vesicle_count 1
    arbuscule_count 1
    visible_hyphae false
    hyphae_coverage 1
    user_id nil
    plot_id nil
    plant_id nil
  end
end
