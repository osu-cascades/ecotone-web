require 'rails_helper'

RSpec.feature 'User creates a biodiversity report' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_biodiversity_report_path
  end

  scenario 'providing valid report data' do
    select('Plot #1', from: 'Plot')
    fill_in('Date', with: '09/11/2001')
    # fill_in('biodiversity_report_temperature', with: '72')
    find(:xpath, "//*[@id='biodiversity_report_temperature']").set 72
    fill_in('Species Richness', with: '10')
    fill_in('Shannon-Wiener Diversity Index', with: '5.0')
    fill_in('Species Evenness', with: '0.5')
    fill_in('Biomass Estimate', with: '1.0')
    click_button('Create Report')
    expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  end

  scenario 'providing invalid report data' do
    click_button('Create Report')
    expect(page).to have_selector '.alert', text: 'The form contains 4 errors.'
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Plot must be specified')
      expect(error_explanations).to have_content("Date can't be blank")
      expect(error_explanations).to have_content('Species richness is not a number')
      expect(error_explanations).to have_content('Diversity index is not a number')
    end
  end

  # describe 'with a soil sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid soil sample data' do
  #     select('composite', from: 'Collection method')
  #     fill_in('pH level', with: '10')
  #     fill_in('biodiversity_report_soil_sample_attributes_temperature', with: '100')
  #     fill_in('Moisture', with: '10')
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No soil sample')
  #     expect(page).to have_content('pH Level: 10')
  #     expect(page).to have_content('Temperature: 100')
  #     expect(page).to have_content('Moisture: 10')
  #   end

  #   scenario 'providing invalid soil sample data' do
  #     fill_in('pH level', with: '-1')
  #     fill_in('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
  #     fill_in('Moisture', with: '-1')
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'The form contains 4 errors.'
  #     expect(page.find('.alert')).to have_content('Soil sample ph level must be greater than or equal to 0')
  #     expect(page.find('.alert')).to have_content('Soil sample temperature is not a number')
  #     expect(page.find('.alert')).to have_content('Soil sample moisture must be greater than or equal to 0')
  #     expect(page.find('.alert')).to have_content("Soil sample collection method can't be blank")
  #     expect(page).to have_css('#soil_sample_fields.collapse.in')
  #     expect(page).to have_field('pH level', with: '-1')
  #     expect(page).to have_field('biodiversity_report_soil_sample_attributes_temperature', with: 'fake')
  #   end
  # end

  # describe 'with one plant sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid plant sample data', js: true do
  #     click_link('Add plant sample')
  #     within('.plant_sample') do
  #       select('Plant Example', from: 'Plant')
  #       fill_in('Abundance', with: '1')
  #       fill_in('Percent cover', with: '50')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No plant samples')
  #     expect(page).to have_content('Common name: Plant Example')
  #     expect(page).to have_content('Abundance: 1')
  #     expect(page).to have_content('Percent Cover: 50')
  #   end

  #   scenario 'providing invalid plant sample data', js: true do
  #     click_link('Add plant sample')
  #     within('.plant_sample') do
  #       select('Plant Example', from: 'Plant')
  #       fill_in('Abundance', with: '-1')
  #       fill_in('Percent cover', with: '-1')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'The form contains 2 errors.'
  #     expect(page.find('.alert')).to have_content('Plant samples abundance must be greater than 0')
  #     expect(page.find('.alert')).to have_content('Plant samples percent cover must be greater than 0')
  #     expect(page).to have_field('Abundance', with: '-1')
  #     expect(page).to have_field('Percent cover', with: '-1')
  #   end
  # end

  # context 'with two plant samples' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid plant sample data', js: true do
  #     click_link('Add plant sample')
  #     within('.plant_sample') do
  #       select('Plant Example', from: 'Plant')
  #       fill_in('Abundance', with: '1')
  #       fill_in('Percent cover', with: '2')
  #     end
  #     click_link('Add plant sample')
  #     within all('.plant_sample').last do
  #       select('Plant Example', from: 'Plant')
  #       fill_in('Abundance', with: '4')
  #       fill_in('Percent cover', with: '5')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No plant samples')
  #     expect(page).to have_content('Common name: Plant Example')
  #     expect(page).to have_content('Abundance: 1')
  #     expect(page).to have_content('Abundance: 4')
  #   end
  # end

  # context 'with one macroinvertebrate sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid macroinvertebrate sample data', js: true do
  #     click_link('Add macroinvertebrate sample')
  #     within('.macroinvertebrate_sample') do
  #       fill_in('Phylum', with: 'Example phylum')
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Quantity', with: '1')
  #       select('Pollinator', from: 'Ecosystem service')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No macroinvertebrate sample')
  #     expect(page).to have_content('Phylum: Example phylum')
  #     expect(page).to have_content('Location in Plot: on a rock')
  #     expect(page).to have_content('Quantity: 1')
  #     expect(page).to have_content('Ecosystem service: Pollinator')
  #   end

  #   scenario 'providing invalid macroinvertebrate sample data', js: true do
  #     click_link('Add macroinvertebrate sample')
  #     within('.macroinvertebrate_sample') do
  #       fill_in('Phylum', with: '')
  #       fill_in('Location in Plot', with: '')
  #       fill_in('Quantity', with: '-1')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: /The form contains .* errors./
  #     expect(page.find('.alert')).to have_content("Macroinvertebrate samples phylum can't be blank")
  #     expect(page.find('.alert')).to have_content("Macroinvertebrate samples Location in Plot can't be blank")
  #     expect(page.find('.alert')).to have_content('Macroinvertebrate samples quantity must be greater than or equal to 0')
  #     expect(page.find('.alert')).to have_content("Macroinvertebrate samples ecosystem service can't be blank")
  #     expect(page.find('.alert')).to have_content('Macroinvertebrate samples ecosystem service is not a valid ecosystem service')
  #     expect(page).to have_field('Phylum', with: '')
  #     expect(page).to have_field('Location in Plot', with: '')
  #     expect(page).to have_field('Quantity', with: '-1')
  #   end
  # end

  # context 'with two macroinvertebrate samples', js: true do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid macroinvertebrate sample data' do
  #     click_link('Add macroinvertebrate sample')
  #     within('.macroinvertebrate_sample') do
  #       fill_in('Phylum', with: 'Example phylum')
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Quantity', with: '1')
  #       select('Pollinator', from: 'Ecosystem service')
  #     end
  #     click_link('Add macroinvertebrate sample')
  #     within all('.macroinvertebrate_sample').last do
  #       fill_in('Phylum', with: 'Example phylum')
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Quantity', with: '1')
  #       select('Pollinator', from: 'Ecosystem service')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No macroinvertebrate sample')
  #     expect(page).to have_content('Phylum: Example phylum')
  #     expect(page).to have_content('Location in Plot: on a rock')
  #     expect(page).to have_content('Quantity: 1')
  #     expect(page).to have_content('Ecosystem service: Pollinator')
  #   end
  # end

  # context 'with a fungi sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid fungi sample data' do
  #     within('.fungi_sample') do
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Size', with: '1.5')
  #       fill_in('Description', with: 'description of fungi')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No fungi sample')
  #     expect(page).to have_content('Location in Plot: on a rock')
  #     expect(page).to have_content('Size: 1.5')
  #     expect(page).to have_content('Description: description of fungi')
  #   end

  #   scenario 'providing invalid fungi sample data' do
  #     within('.fungi_sample') do
  #       fill_in('Location in Plot', with: '')
  #       fill_in('Size', with: '-1')
  #       fill_in('Description', with: '')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: /The form contains .* errors./
  #     expect(page.find('.alert')).to have_content("Fungi sample Location in Plot can't be blank")
  #     expect(page.find('.alert')).to have_content('Fungi sample size must be greater than or equal to 0')
  #     expect(page.find('.alert')).to have_content("Fungi sample description can't be blank")
  #     expect(page).to have_css('#fungi_sample_fields.collapse.in')
  #     expect(page).to have_field('Location in Plot', with: '')
  #     expect(page).to have_field('Size', with: '-1')
  #     expect(page).to have_field('Description', with: '')
  #   end
  # end

  # context 'with a lichen sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid lichen sample data' do
  #     within('.lichen_sample') do
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Description', with: 'description of lichen')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No lichen sample')
  #     expect(page).to have_content('Location in Plot: on a rock')
  #     expect(page).to have_content('Description: description of lichen')
  #   end
  # end

  # context 'with a nonvascular plant sample' do
  #   before { fill_in_report_fields }

  #   scenario 'providing valid nonvascular plant sample data' do
  #     within('.nonvascular_plant_sample') do
  #       fill_in('Location in Plot', with: 'on a rock')
  #       fill_in('Description', with: 'description of nonvascular plant')
  #     end
  #     click_button('Create Biodiversity report')
  #     expect(page).to have_selector '.alert', text: 'Biodiversity report was successfully created.'
  #     expect(page).to have_content(BiodiversityReport.last.to_s)
  #     click_link(BiodiversityReport.last.to_s)
  #     expect(page).to have_no_content('No nonvascular plant sample')
  #     expect(page).to have_content('Location in Plot: on a rock')
  #     expect(page).to have_content('Description: description of nonvascular plant')
  #   end
  # end

end
