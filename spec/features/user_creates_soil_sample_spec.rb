require 'rails_helper'

RSpec.feature 'User creates a soil sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_soil_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('point', from: 'Collection method')
    fill_in('pH level', with: '4')
    fill_in('Temperature', with: '72')
    fill_in('Moisture', with: '10')
    click_on('Create Soil sample')
    expect(page).to have_content('Soil sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    skip
  end

end
