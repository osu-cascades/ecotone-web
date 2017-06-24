require 'rails_helper'

RSpec.describe "plants/show", type: :view do
  before do
    @plant = assign(:plant, Plant.create!(
      :common_name => "Common Name",
      :scientific_name => "Scientific Name",
      :habitat_type => "Habitat Type",
      :sunlight_tolerance => "Sunlight Tolerance"
    ))
  end
end
