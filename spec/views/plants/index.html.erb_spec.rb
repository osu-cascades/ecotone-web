require 'rails_helper'

RSpec.describe "plants/index", type: :view do
  before(:each) do
    assign(:plants, [
      Plant.create!(
        :common_name => "Common Name",
        :scientific_name => "Scientific Name",
        :habitat_type => "Habitat Type",
        :sunlight_tolerance => "Sunlight Tolerance"
      ),
      Plant.create!(
        :common_name => "Common Name",
        :scientific_name => "Scientific Name",
        :habitat_type => "Habitat Type",
        :sunlight_tolerance => "Sunlight Tolerance"
      )
    ])
  end
end
