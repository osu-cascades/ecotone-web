require 'rails_helper'

RSpec.feature 'User creates a fungi sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_fungi_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection Date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    fill_in('Location in Plot', with: 'Fake location')
    fill_in('Size', with: '10.0')
    fill_in('Description', with: 'Fake description')
    click_on('Create Sample')
    expect(page).to have_content('Fungi sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Sample')
    expect(page).to have_content('The form contains 5 errors.')
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content('Plot must exist')
      expect(error_explanations).to have_content("Collected on can't be blank")
      expect(error_explanations).to have_content("Location in Plot can't be blank")
      expect(error_explanations).to have_content('Size is not a number') 
      expect(error_explanations).to have_content("Description can't be blank") 
    end
  end

end
