require 'rails_helper'

RSpec.feature 'Admin creates a plot' do
  context 'when logged in' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:plant)
    end

    scenario 'providing valid plot attributes' do
      visit new_plot_path
      fill_in('Plot', with: 1)
      select('Plant Example', from: 'Featured Plant')
      fill_in('Description', with: 'Top of the hill')
      fill_in('Latitude', with: 1234)
      fill_in('Longitude', with: 1234)
      fill_in('Elevation', with: 3000)
      fill_in('Area', with: 315.2)
      fill_in('Aspect', with: 'South')
      fill_in('Origin', with: 'Salvage')
      check('Inoculated')
      fill_in('Initial Planting Date', with: 'Spring 2016')
      fill_in('Initial Succession', with: 'example succession')
      click_on('Create Plot')
      expect(page).to have_content('Plot was successfully created.')
    end
  end
end
