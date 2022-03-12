require 'rails_helper'

RSpec.feature 'User creates a tree sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_tree_sample_path
  end

  describe 'with valid sample attributes' do

    before do
      fill_in('Collection Date', with: '09/11/2001')
      select('Plot #1', from: 'Plot')
      select('Plant Example', from: 'Species')
      fill_in('Tag', with: 42)
      select('Seedling', from: 'Growth Stage')
      fill_in('DBH', with: 1.5)
    end

    scenario 'and optional values' do
      fill_in('Lower Canopy Height', with: 2.5)
      fill_in('Upper Canopy Height', with: 3.5)
      fill_in('Latitude N', with: 4.5)
      fill_in('Longitude W', with: 5.5)
      click_on('Create Sample')
      expect(page).to have_content('Tree sample was successfully created')
    end

    scenario 'without optional values' do
      click_on('Create Sample')
      expect(page).to have_content('Tree sample was successfully created')
    end
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Sample')
    expect(page).to have_content('The form contains 6 errors.')
  end

end
