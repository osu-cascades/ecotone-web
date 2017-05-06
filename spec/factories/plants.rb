FactoryGirl.define do

  factory :plant do
    common_name "Plant Example"
    scientific_name "Scientific Example"
    description "Description Example"
    habitat_type "Habitat Example"
    sunlight_tolerance "Sunlight Example"
  end

  factory :invalid_plant, parent: :plant do |f|
    f.common_name nil
  end
  
end
