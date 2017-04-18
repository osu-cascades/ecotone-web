require 'rails_helper'

RSpec.describe "admin create plant" do

  it "accepts valid signup information" do
    visit new_plant_path
    fill_in('Common name', :with => 'Common Name Example')
    fill_in('Scientific name', :with => 'Species Name example')
    fill_in('Habitat type', :with => 'Jungle')
    fill_in('Sunlight tolerance', :with => 'Very low')
    click_on("Add plant")
    expect(page).to have_content("Plant was successfully created")
  end
end