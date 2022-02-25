require 'rails_helper'
RSpec.feature 'Admin edits a plot' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }
  
      before do
        sign_in(user)
        create(:plot, id: '1')
      end

      scenario 'by selecting an existing plot' do
        visit plot_path(1)
        Capybara.page.find(".icon-edit").click
        visit edit_plot_path(1)
        click_button('Update Plot')
        expect(page).to have_selector '.alert', text: 'Plot was successfully updated'
      end

     
    end

end
