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
      expect(page).to have_selector '.alert', text: 'The form contains 5 errors.'
      page.find('#error_explanation').tap do |error_explanations|
        expect(error_explanations).to have_content('Plot must be specified')
        expect(error_explanations).to have_content("Date can't be blank")
        expect(error_explanations).to have_content("Time can't be blank")
        expect(error_explanations).to have_content('Species richness is not a number')
        expect(error_explanations).to have_content('Diversity index is not a number')
      end
    end

  end

  describe 'with a soil sample' do

    before { fill_in_report_fields }

    scenario 'providing valid soil sample data' do
      fill_in('pH level', with: '10')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '100')
      fill_in('Moisture', with: '10')
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No soil sample')
      expect(page).to have_content('pH Level: 10')
      expect(page).to have_content('Temperature: 100')
      expect(page).to have_content('Moisture: 10')
    end

    scenario 'providing invalid soil sample data' do
      fill_in('pH level', with: '-1')
      fill_in('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
      fill_in('Moisture', with: '-1')
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'The form contains 3 errors.'
      expect(page.find('#error_explanation')).to have_content('Soil sample ph level must be greater than or equal to 0')
      expect(page.find('#error_explanation')).to have_content('Soil sample temperature is not a number')
      expect(page.find('#error_explanation')).to have_content('Soil sample moisture must be greater than or equal to 0')
      expect(page).to have_css('#soil_fields.collapse.in')
      expect(page).to have_field('pH level', with: '-1')
      expect(page).to have_field('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
    end

  end

  describe 'with one plant sample' do

    before { fill_in_report_fields }

    scenario 'providing valid plant sample data' do
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '1')
        fill_in('Percent cover', with: '50')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No plant samples')
      expect(page).to have_content('Common name: Plant Example')
      expect(page).to have_content('Abundance: 1')
      expect(page).to have_content('Percent Cover: 50')
    end

    scenario 'providing invalid plant sample data' do
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '-1')
        fill_in('Percent cover', with: '-1')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'The form contains 2 errors.'
      expect(page.find('#error_explanation')).to have_content('Plant samples abundance must be greater than 0')
      expect(page.find('#error_explanation')).to have_content('Plant samples percent cover must be greater than 0')
      expect(page).to have_field('Abundance', with: '-1')
      expect(page).to have_field('Percent cover', with: '-1')
    end

  end

  context 'with two plant samples' do

    before { fill_in_report_fields }

    scenario 'providing valid plant sample data', js: true do
      within('.plant_sample') do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '1')
        fill_in('Percent cover', with: '2')
      end
      click_link('Add plant sample')
      within all('.plant_sample').last do
        select('Plant Example', from: 'Plant')
        fill_in('Abundance', with: '4')
        fill_in('Percent cover', with: '5')
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

  context 'with a fungi sample' do

    before { fill_in_report_fields }

    scenario 'providing valid fungi sample data' do
      within('.fungi_sample') do
        fill_in('Location within plot', with: 'on a rock')
        fill_in('Size', with: '1.5')
        fill_in('Description', with: 'description of fungi')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No fungi sample')
      expect(page).to have_content('Location within plot: on a rock')
      expect(page).to have_content('Size: 1.5')
      expect(page).to have_content('Description: description of fungi')
    end

    scenario 'providing invalid fungi sample data' do
      within('.fungi_sample') do
        fill_in('Location within plot', with: '')
        fill_in('Size', with: '-1')
        fill_in('Description', with: '')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector ".alert", text: /The form contains .* errors./
      expect(page.find('#error_explanation')).to have_content("Fungi sample location within plot can't be blank")
      expect(page.find('#error_explanation')).to have_content('Fungi sample size must be greater than or equal to 0')
      expect(page.find('#error_explanation')).to have_content("Fungi sample description can't be blank")
      expect(page).to have_css('#fungi_fields.collapse.in')
      expect(page).to have_field('Location within plot', with: '')
      expect(page).to have_field('Size', with: '-1')
      expect(page).to have_field('Description', with: '')
    end

  end

  context 'with a lichen sample' do

    before { fill_in_report_fields }

    scenario 'providing valid lichen smaple data' do
      within('.lichen_sample') do
        fill_in('Location within plot', with: 'on a rock')
        fill_in('Description', with: 'description of lichen')
      end
      click_button('Create Biodiversity report')
      expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
      expect(page).to have_content(BiodiversityReport.last.to_s)
      click_link(BiodiversityReport.last.to_s)
      expect(page).to have_no_content('No lichen sample')
      expect(page).to have_content('Location within plot: on a rock')
      expect(page).to have_content('Description: description of lichen')
    end

  end

  def fill_in_report_fields
    select('Plot #1', from: 'Plot')
    fill_in('Date', with: '09/11/2001')
    fill_in('Time', with: '04:45 PM')
    fill_in('biodiversity_report_temperature', with: '72')
    fill_in('Species richness', with: '10')
    fill_in('Shannon-Wiener diversity index', with: '5.0')
  end

end
