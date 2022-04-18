require 'rails_helper'

RSpec.feature 'Admin hits cancel' do
  context 'while editing existing plant' do
    let(:user) { create(:user, :admin) }

    before do
      sign_in(user)
      create(:plant, id: '1')
    end

    scenario 'after visitng edit plant page' do
      visit edit_plant_path(1)
      click_on('Cancel')
      expect(page).to have_current_path('/plants/1/edit')
    end
  end
end