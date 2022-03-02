require 'rails_helper'
RSpec.feature 'Admin deletes a plot' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }

      before do
        sign_in(user)
        create(:plot, id: '1')
      end

      scenario 'by selecting an existing plot' do
        visit plot_path(1)
        click_link 'Delete'
        expect(page).to have_content('Plot was successfully deleted.')
      end


    end

end 