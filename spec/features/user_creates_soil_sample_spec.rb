require 'rails_helper'

RSpec.feature 'User creates a soil sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_soil_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('point', from: 'Collection method')
    fill_in('pH level', with: '4')
    fill_in('Temperature', with: '72')
    fill_in('Moisture', with: '10')
    fill_in('Nitrogen Amount', with: '1')
    fill_in('Phosphorus Amount', with: '1')
    fill_in('Potassium Amount', with: '1')
    select('high', from: 'Nitrogen')
    select('low', from: 'Phosphorus')
    select('med', from: 'Potassium')
    click_on('Create Sample')
    expect(page).to have_content('Soil sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Sample')
    expect(page).to have_content('The form contains 6 errors.')
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Plot must exist')
      expect(error_explanations).to have_content("Collected on can't be blank")
      expect(error_explanations).to have_content("Collection method can't be blank")
      expect(error_explanations).to have_content('Ph level is not a number') 
      expect(error_explanations).to have_content('Temperature is not a number') 
      expect(error_explanations).to have_content('Moisture is not a number')
    end
  end

  scenario 'without nutrient levels' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('point', from: 'Collection method')
    fill_in('pH level', with: '4')
    fill_in('Temperature', with: '72')
    fill_in('Moisture', with: '10')
    click_on('Create Sample')
    expect(page).to have_content('Soil sample was successfully created')
  end

  scenario 'without all nutrients' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('point', from: 'Collection method')
    fill_in('pH level', with: '4')
    fill_in('Temperature', with: '72')
    fill_in('Moisture', with: '10')
    select('high', from: 'Nitrogen')
    select('low', from: 'Phosphorus')
    click_on('Create Sample')
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Nutrients must all have values')
      expect(error_explanations).to have_content('Nutrients must have both a level and an amount')
    end
  end

end
