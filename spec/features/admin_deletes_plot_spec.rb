equire 'rails_helper'
RSpec.feature 'Admin deletes a plot' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }

      before do
        sign_in(user)
        create(:plot, id: '1')
      end

      scenario 'by selecting an existing plot', js: true  do
        visit plot_path(1)
        Capybara.page.find(".icon-delete2").click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_selector '.alert', text: 'Plot was successfully destroyed'
      end


    end

end 