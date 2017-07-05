require 'rails_helper'

RSpec.feature 'Resetting password' do

  let(:user) { create(:user, :resetting_password) }

  context 'user supplies their email' do
    before { visit new_password_reset_path }
    scenario 'provides invalid email' do
      fill_in('Email', with: '')
      click_button('Submit')
      expect(page).to have_selector '.alert', text: 'Email address not found'
    end
    scenario 'provides valid email' do
      fill_in('Email', with: user.email)
      click_button('Submit')
      expect(page).to have_selector '.alert', text: 'Email sent with password reset instructions'
    end
  end

  context 'user submits a new password' do

    before { visit edit_password_reset_path(user.id, user.reset_token, email: user.email) }

    scenario 'with mismatched passwords' do
      skip 'need to push shared/error partial update to staging to test'
      fill_in('Password', with: 'foo')
      fill_in('Confirmation', with: 'bar')
      click_button('Update password')
      expect(page).to have_selector '.alert', text: 'The form contains 2 errors.'
    end

    scenario 'with matching passwords' do
      skip 'need to push shared/error partial update to staging to test'
      fill_in('Password', with: 'foo')
      fill_in('Confirmation', with: 'foo')
      click_button('Update password')
      expect(page).to have_selector '.alert', text: 'Password has been reset.'
    end
  end
end