require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while creating new plant' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
    end

    scenario 'after visitng add plants page' do
      visit new_plant_path
      click_on('Cancel')
      expect(page).to have_current_path('/plants/new')
    end
  end
end