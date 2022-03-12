require 'rails_helper'

RSpec.feature 'User creates a macroinvertebrate sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_macroinvertebrate_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    fill_in('Phylum', with: 'Fake phylum')
    fill_in('Location in Plot', with: 'Fake location')
    fill_in('Quantity', with: 1)
    select(MacroinvertebrateSample::ECOSYSTEM_SERVICES.first, from: 'Ecosystem service')
    click_on('Create Sample')
    expect(page).to have_content('Macroinvertebrate sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Sample')
    expect(page).to have_content('The form contains 7 errors.')
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Plot must exist')
      expect(error_explanations).to have_content("Collected on can't be blank")
      expect(error_explanations).to have_content("Phylum can't be blank")
      expect(error_explanations).to have_content("Location in Plot can't be blank")
      expect(error_explanations).to have_content('Quantity is not a number')
      expect(error_explanations).to have_content("Ecosystem service can't be blank")
      expect(error_explanations).to have_content('Ecosystem service is not a valid ecosystem service')
    end
    
  end

end
