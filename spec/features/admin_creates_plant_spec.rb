require 'rails_helper'

RSpec.feature 'Admin creates a plant' do
  context 'when logged in' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
    end

    scenario 'providing valid plant attributes' do
      visit new_plant_path
      fill_in('Common name', with: 'Common Name Example')
      fill_in('Scientific name', with: 'Species Name example')
      fill_in('Description', with: 'Description example')
      fill_in('Habitat type', with: 'Jungle')
      fill_in('Tolerance', with: 'Very low')
      check('Invasive?')
      click_on('Create Plant')
      expect(page).to have_content('Plant was successfully created.')
    end
  end
end
