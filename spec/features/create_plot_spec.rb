require 'rails_helper'

RSpec.describe "admin create plot" do

  let(:user) { create(:user, :admin) }

  context "admin logged in" do

    before do
      sign_in(user)
      create(:plant)
    end

    scenario "Admin creates a new plot" do
      visit new_plot_path
      fill_in('Plot', :with => 1)
      select('Plant Example', :from => 'Featured plant')
      fill_in('Location description', :with => 'Top of the hill')
      fill_in('Latitude', :with => 1234)
      fill_in('Longitude', :with => 1234)
      fill_in('Elevation', :with => 3000)
      fill_in('Area', :with => 315.2)
      fill_in('Aspect', :with => 'South')
      fill_in('Origin', :with => 'Salvage')
      check('Inoculated')
      fill_in('Initial planting date', :with => 'Spring 2016')
      fill_in('Initial succession', :with => 'example succession')
      click_on("Add plot")
      expect(page).to have_content("Plot was successfully created.")
    end
  end
end
