FactoryBot.define do
  factory :plant, aliases: [:featured_plant] do
    common_name { 'Plant Example' }
    scientific_name { 'Scientific Example' }
    description { 'Description Example' }
    habitat_type { 'Habitat Example' }
    tolerance { 'Tolerance Example' }
    invasive { false }
  end

  factory :invalid_plant, parent: :plant do |f|
    f.common_name { nil }
  end
end
