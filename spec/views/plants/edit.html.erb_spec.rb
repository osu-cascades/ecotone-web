require 'rails_helper'

RSpec.describe "plants/edit", type: :view do
  before do
    @plant = assign(:plant, Plant.create!(
      :common_name => "MyString",
      :scientific_name => "MyString",
      :habitat_type => "MyString",
      :sunlight_tolerance => "MyString"
    ))
  end
end
