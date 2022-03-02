require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while creating new plot' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:plot, id: '1')
    end

    scenario 'after visitng add plots page' do
      visit edit_plot_path(1)
      click_on('Cancel')
      expect(page).to have_current_path('/plots1?cancel=Cancel')
    end
  end
end