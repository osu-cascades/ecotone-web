require 'rails_helper'

RSpec.describe "plants/show", type: :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
      :common_name => "Common Name",
      :scientific_name => "Scientific Name",
      :habitat_type => "Habitat Type",
      :sunlight_tolerance => "Sunlight Tolerance"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Common Name/)
    expect(rendered).to match(/Scientific Name/)
    expect(rendered).to match(/Habitat Type/)
    expect(rendered).to match(/Sunlight Tolerance/)
  end
end
