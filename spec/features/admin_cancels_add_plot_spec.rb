require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while creating new plot' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
    end

    scenario 'after filling in a few attributes' do
      visit new_plot_path
      fill_in('Plot', with: 1)
      fill_in('Description', with: 'Top of the hill')
      
      click_on('Cancel')
      expect(page).to have_current_path('/plots?cancel=Cancel')
    end
  end
end
