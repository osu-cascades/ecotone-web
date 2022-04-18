require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while creating new plot' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
    end

    scenario 'after visitng add plots page' do
      visit new_plot_path
      click_on('Cancel')
      expect(page).to have_current_path('/plots/new')
    end
  end
end
