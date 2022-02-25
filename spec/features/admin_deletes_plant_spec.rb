require 'rails_helper'
RSpec.feature 'Admin deletes a plant' do
    context 'when logged in' do
      let(:user) { create(:user, :admin) }

      before do
        sign_in(user)
        create(:plant, id: '1')
      end

      scenario 'by selecting an existing plant', js: true  do
        visit plant_path(1)
        Capybara.page.find(".icon-delete2").click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_selector '.alert', text: 'Plant was successfully destroyed'
      end


    end

end 