require 'rails_helper'

RSpec.feature 'User creates a plant sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_plant_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Plant')
    fill_in('Abundance', with: 1)
    fill_in('Percent cover', with: 1)
    click_on('Create Plant sample')
    expect(page).to have_content('Plant sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    skip
  end

end
