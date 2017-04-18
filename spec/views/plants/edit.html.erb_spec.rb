require 'rails_helper'

RSpec.describe "plants/edit", type: :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
      :common_name => "MyString",
      :scientific_name => "MyString",
      :habitat_type => "MyString",
      :sunlight_tolerance => "MyString"
    ))
  end

  it "renders the edit plant form" do
    skip
    render

    assert_select "form[action=?][method=?]", plant_path(@plant), "post" do

      assert_select "input#plant_common_name[name=?]", "plant[common_name]"

      assert_select "input#plant_scientific_name[name=?]", "plant[scientific_name]"

      assert_select "input#plant_habitat_type[name=?]", "plant[habitat_type]"

      assert_select "input#plant_sunlight_tolerance[name=?]", "plant[sunlight_tolerance]"
    end
  end
end
