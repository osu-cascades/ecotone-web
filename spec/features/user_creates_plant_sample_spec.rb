require 'rails_helper'

RSpec.feature 'User creates a plant sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_plant_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Plant')
    fill_in('Abundance', with: 1)
    fill_in('Coverage', with: 1)
    fill_in('Biomass Estimate', with: 1.0)
    click_on('Create Sample')
    expect(page).to have_content('Plant sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Sample')
    expect(page).to have_content('The form contains 5 errors.')
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Plant must be specified')
      expect(error_explanations).to have_content('Plot must exist')
      expect(error_explanations).to have_content("Collected on can't be blank")
      expect(error_explanations).to have_content('Abundance is not a number')
      expect(error_explanations).to have_content('Percent cover is not a number') 
    end
  end

end
