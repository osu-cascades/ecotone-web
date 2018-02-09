require 'rails_helper'

RSpec.feature 'User creates a tree sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_tree_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Species')
    fill_in('Tag', with: 42)
    select('Seedling', from: 'Growth stage')
    fill_in('DBH', with: 1.5)
    fill_in('Lower canopy height', with: 2.5)
    fill_in('Upper canopy height', with: 3.5)
    fill_in('Latitude N', with: 4.5)
    fill_in('Longitude W', with: 5.5)
    click_on('Create Tree sample')
    expect(page).to have_content('Tree sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    skip
  end

end
