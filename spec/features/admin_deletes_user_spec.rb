require 'rails_helper'

RSpec.feature 'Admin deletes user' do
  context 'when logged in' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:user, :alternate, id: '1')
    end

    scenario 'by selecting an existing user' do
      visit user_path(1)
      click_link 'Delete'
      expect(page).to have_content('User deleted.')
    end
  end
end
