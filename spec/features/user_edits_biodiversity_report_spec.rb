require 'rails_helper'

RSpec.feature "User edits a biodiversity report" do

  let(:user) { create(:user) }
  let(:biodiversity_report) { create(:biodiversity_report, author: user) }

  before do
    sign_in(user)
  end

  context "without an existing soil sample" do

    before do
      visit edit_biodiversity_report_path(biodiversity_report)
    end

    scenario "providing valid soil sample data" do
      fill_in('pH level', with: '10')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '100')
      click_button('Update Biodiversity report')
      expect(page).to have_selector ".alert", text: "Biodiversity report was successfully updated."
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_no_content('No soil sample')
      expect(page).to have_content('pH Level: 10')
      expect(page).to have_content('Temperature: 100')
    end

  end

  context "with an existing soil sample" do

    # Coupled with the `let(:biodiversity_report)` above, creates a biodiversity
    # report with the existing logged in user and a soil sample. Because of the
    # way FactoryGirl creates associated models, do it this way, rather than
    # with a trait that sets the soil_sample association in the biodiversity_report
    # factory and `create(:biodiversity_report, :with_soil_sample, author: user )`.
    let!(:soil_sample) { create(:soil_sample, biodiversity_report: biodiversity_report) }

    before do
      visit edit_biodiversity_report_path(biodiversity_report)
    end

    scenario "omitting the existing soil sample" do
      fill_in('pH level', with: '')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '')
      page.find('#biodiversity_report_soil_sample_attributes__destroy', visible: false).set('1')
      click_button('Update Biodiversity report')
      expect(page).to have_selector ".alert", text: "Biodiversity report was successfully updated."
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_content('No soil sample')
      expect(page).to have_no_content('pH Level: 1.5') # Set by soil_sample factory
      expect(page).to have_no_content('Temperature: 20.5') # Set by soil_sample factory
    end

    scenario "modifying the existing soil sample providing valid data" do
      fill_in('pH level', with: '2')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '99')
      click_button('Update Biodiversity report')
      expect(page).to have_selector ".alert", text: "Biodiversity report was successfully updated."
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_no_content('No soil sample')
      expect(page).to have_content('pH Level: 2')
      expect(page).to have_content('Temperature: 99')
    end

    scenario "modifying the existing soil sample providing invalid data" do
      fill_in('pH level', with: '-1')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
      click_button('Update Biodiversity report')
      expect(page).to have_selector ".alert", text: /The form contains .* errors./
      expect(page.find("#error_explanation")).to have_content("Soil sample ph level must be greater than or equal to 0")
      expect(page.find("#error_explanation")).to have_content("Soil sample temperature is not a number")
      expect(page).to have_css('#soil_sample_fields.collapse.in')
      expect(page).to have_field('pH level', with: '-1')
      expect(page).to have_field('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
    end

  end

  context 'without an existing plant sample' do

    before do
      visit edit_biodiversity_report_path(biodiversity_report)
    end

    scenario 'providing valid plant sample data', js: true do
      click_link('Add plant sample')
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '1')
        fill_in('Percent cover', with: '2')
      end
      click_button('Update Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully updated.'
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Common name: Plant Example')
      expect(page).to have_content('Abundance: 1')
      expect(page).to have_content('Percent Cover: 2')
    end

  end

  context 'with one existing plant sample' do

    let!(:plant_sample) { create(:plant_sample, biodiversity_report: biodiversity_report) }

    before do
      visit edit_biodiversity_report_path(biodiversity_report)
    end

    scenario 'removes the existing plant sample', js: true do
      click_link('Remove plant sample')
      click_button('Update Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully updated.'
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_content('No plant samples')
    end

    scenario 'modifying the existing plant sample with valid data' do
      within('.plant_sample') do
        fill_in('Abundance', with: '2')
        fill_in('Percent cover', with: '3')
      end
      click_button('Update Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully updated.'
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Common name: Plant Example')
      expect(page).to have_content('Abundance: 2')
      expect(page).to have_content('Percent Cover: 3')
    end

    scenario "modifying the existing plant sample providing invalid data" do
      within('.plant_sample') do
        fill_in('Abundance', with: '-1')
        fill_in('Percent cover', with: '-1')
      end
      click_button('Update Biodiversity report')
      expect(page).to have_selector ".alert", text: /The form contains .* errors./
      expect(page.find('#error_explanation')).to have_content('Plant samples abundance must be greater than 0')
      expect(page.find('#error_explanation')).to have_content('Plant samples percent cover must be greater than 0')
      expect(page).to have_field('Abundance', with: '-1')
      expect(page).to have_field('Percent cover', with: '-1')
    end

  end

  context 'with two existing plant samples' do

    let!(:plant_sample_1) { create(:plant_sample, biodiversity_report: biodiversity_report) }
    let!(:plant_sample_2) { create(:plant_sample, biodiversity_report: biodiversity_report) }

    before do
      visit edit_biodiversity_report_path(biodiversity_report)
    end

    scenario 'modifying the existing plant samples with valid data' do
      within all('.plant_sample').first do
        fill_in('Abundance', with: '2')
        fill_in('Percent cover', with: '2')
      end
      within all('.plant_sample').last do
        fill_in('Abundance', with: '3')
        fill_in('Percent cover', with: '3')
      end
      click_button('Update Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully updated.'
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Abundance: 2')
      expect(page).to have_content('Abundance: 3')
    end

    scenario 'remove both existing plant samples', js: true do
      within all('.plant_sample').first do
        click_link('Remove plant sample')
      end
      click_link('Remove plant sample')
      click_button('Update Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully updated.'
      expect(page).to have_content(biodiversity_report.to_s)
      expect(page).to have_content('No plant samples')
    end

  end

end
