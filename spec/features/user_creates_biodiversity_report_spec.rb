require 'rails_helper'

RSpec.feature 'User creates a biodiversity report' do

  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_biodiversity_report_path
  end

  describe 'without a soil sample nor a plant sample' do

    scenario 'providing valid report data' do
      fill_in_report_fields
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_content('No soil sample')
    end

    scenario 'providing invalid report data' do
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'The form contains 4 errors.'
      page.find('#error_explanation').tap do |error_explanations|
        expect(error_explanations).to have_content('Plot must be specified')
        expect(error_explanations).to have_content("Date can't be blank")
        expect(error_explanations).to have_content("Time can't be blank")
        expect(error_explanations).to have_content('Species richness is not a number')
      end
    end

  end

  describe 'with a soil sample' do

    before { fill_in_report_fields }

    scenario 'providing valid soil sample data' do
      fill_in('pH level', with: '10')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '100')
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No soil sample')
      expect(page).to have_content('pH Level: 10')
      expect(page).to have_content('Temperature: 100')
    end

    scenario 'providing invalid soil sample data' do
      fill_in('pH level', with: '-1')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'The form contains 2 errors.'
      expect(page.find('#error_explanation')).to have_content('Soil sample ph level must be greater than or equal to 0')
      expect(page.find('#error_explanation')).to have_content('Soil sample temperature is not a number')
      expect(page).to have_css('#soil_sample_fields.collapse.in')
      expect(page).to have_field('pH level', with: '-1')
      expect(page).to have_field('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
    end

  end

  describe 'with one existing plant sample' do

    before { fill_in_report_fields }

    scenario 'providing valid plant sample data' do
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '1')
        fill_in('Percent cover', with: '50')
        fill_in('Biomass estimate', with: '100')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Common name: Plant Example')
      expect(page).to have_content('Abundance: 1')
      expect(page).to have_content('Percent Cover: 50')
      expect(page).to have_content('Biomass Estimate: 100.0')
    end

    scenario 'providing invalid plant sample data' do
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '-1')
        fill_in('Percent cover', with: '-1')
        fill_in('Biomass estimate', with: '-1')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'The form contains 3 errors.'
      expect(page.find('#error_explanation')).to have_content('Plant samples abundance must be greater than 0')
      expect(page.find('#error_explanation')).to have_content('Plant samples percent cover must be greater than 0')
      expect(page.find('#error_explanation')).to have_content('Plant samples biomass estimate must be greater than 0')
      expect(page).to have_field('Abundance', with: '-1')
      expect(page).to have_field('Percent cover', with: '-1')
      expect(page).to have_field('Biomass estimate', with: '-1')
    end

  end

  context 'with two existing plant samples' do

    before { fill_in_report_fields }

    scenario 'providing valid plant sample data', js: true do
      within ('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '1')
        fill_in('Percent cover', with: '2')
        fill_in('Biomass estimate', with: '3')
      end
      click_link('Add plant sample')
      within all('.plant_sample').last do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '4')
        fill_in('Percent cover', with: '5')
        fill_in('Biomass estimate', with: '6')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Common name: Plant Example')
      expect(page).to have_content('Abundance: 1')
      expect(page).to have_content('Abundance: 4')
    end

  end

  def fill_in_report_fields
    select('Plot #1', from: 'Plot')
    fill_in('Date', with: '09/11/2001')
    fill_in('Time', with: '04:45 PM')
    fill_in('biodiversity_report_temperature', with: '72')
    fill_in('biodiversity_report_biomass_estimate', with: '50')
    fill_in('Species richness', with: '10')
    fill_in('Shannon-Wiener Diversity Index', with: '5.0')
  end

end
