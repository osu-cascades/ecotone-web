require 'rails_helper'

RSpec.feature "Creating biodiversity reports" do

  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_biodiversity_report_path
  end

  context "without a soil sample or a plant sample" do

    scenario "as a user providing valid inputs" do
      select('Plot #1', from: 'Plot')
      fill_in('Date', :with => '09/11/2001')
      fill_in('Time', :with => '04:45 PM')
      fill_in('biodiversity_report_temperature', :with => '72')
      fill_in('biodiversity_report_biomass_estimate', :with => '50')
      fill_in('Species richness', :with => '10')
      click_button('Add biodiversity report')
      expect(page).to have_selector ".alert", text: "Biodiversity report was successfully created."
      expect(page).to have_content(BiodiversityReport.last.to_s)
    end

  end

end
