require 'rails_helper'

RSpec.feature 'User creates a species variation observation' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_species_variation_observation_path
  end

  scenario 'with valid attributes' do
    fill_in('Observation date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Plant')
    fill_in('Average height', with: '10.0')
    fill_in('Average width', with: '10.0')
    fill_in('Qualitative observations', with: 'Fake description')
    click_on('Create Species variation observation')
    expect(page).to have_content('Species variation observation was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Species variation observation')
    expect(page).to have_content('The form contains 5 errors')
  end

end
