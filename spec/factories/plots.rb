FactoryGirl.define do
  factory :plot do
    plot_id 1
    latitude 1.5
    longitude 1.5
    elevation 1.5
    area 1.5
    location_description "MyText"
    aspect "MyString"
    origin "MyString"
    inoculated false
    initial_planting_date "MyString"
    initial_succession "MyString"
    photo "MyString"
  end
end
