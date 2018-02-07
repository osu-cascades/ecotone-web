FactoryGirl.define do
  factory :species_variation_observation do
    observed_on "2018-02-06"
    user nil
    plot nil
    plant nil
    average_height 1.5
    average_width 1.5
    description "MyString"
    photo ""
  end
end
