require 'rails_helper'
RSpec.feature 'Admin edits a plant' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }
  
      before do
        sign_in(user)
        create(:plant, id: '1')
      end

      scenario 'by selecting an existing plant' do
        visit plant_path(1)
        Capybara.page.find(".icon-edit").click
        visit edit_plant_path(1)
        click_button('Update Plant')
        expect(page).to have_selector '.alert', text: 'Plant was successfully updated'
      end

     
    end

end