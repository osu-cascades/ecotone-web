require 'rails_helper'

RSpec.feature 'User logs out' do
  context 'when logged in' do
    let(:user) { create(:user) }
    before { sign_in(user) }

    scenario 'successfully logs out' do
      visit root_path
      expect(page).to have_no_link 'Log in'
      expect(page).to have_link 'Log out'
      click_link 'Log out'
      expect(page).to have_no_link 'Log out'
      expect(page).to have_link 'Log in'
      expect(page).to have_selector '.alert', text: 'You have logged out.'
    end
  end
end
