require 'rails_helper'
RSpec.feature 'Admin deletes a plant' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }

      before do
        sign_in(user)
        create(:plant, id: '1')
      end

      scenario 'by selecting an existing plant' do
        visit plant_path(1)
        click_link 'Delete'
        expect(page).to have_content('Plant was successfully deleted.')
      end


    end

end 