require 'rails_helper'

RSpec.feature 'User creates a macroinvertebrate sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_macroinvertebrate_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    fill_in('Phylum', with: 'Fake phylum')
    fill_in('Location within plot', with: 'Fake location')
    fill_in('Quantity', with: 1)
    select(MacroinvertebrateSample::ECOSYSTEM_SERVICES.first, from: 'Ecosystem service')
    click_on('Create Macroinvertebrate sample')
    expect(page).to have_content('Macroinvertebrate sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    skip
  end

end
