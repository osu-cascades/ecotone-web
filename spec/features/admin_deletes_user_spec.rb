require 'rails_helper'

RSpec.feature 'Admin deletes user' do
  context 'when logged in' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:user, :alternate)
    end

    scenario 'selecting an existing user' do
      visit users_path
      expect(page).to have_link 'Delete'
      click_link 'Delete'
      expect(page).to have_selector '.alert', text: 'User deleted.'
    end
  end
end
