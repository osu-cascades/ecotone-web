require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while editing existing plot' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:plot, id: '1')
    end

    scenario 'after visitng edit plot page' do
      visit edit_plot_path(1)
      click_on('Cancel')
      expect(page).to have_current_path('/plots/1/edit')
    end
  end
end