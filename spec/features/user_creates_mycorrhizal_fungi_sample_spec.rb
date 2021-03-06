require 'rails_helper'

RSpec.feature 'User creates a mycorrhizal fungi sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_mycorrhizal_fungi_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Plant')
    fill_in('Length', with: 1)
    select('4x', from: 'Magnification')
    fill_in('Vesicle count', with: '100')
    fill_in('Arbuscule count', with: '100')
    check('Visible hyphae')
    fill_in('Hyphae coverage', with: '50')
    click_on('Create Mycorrhizal fungi sample')
    expect(page).to have_content('Mycorrhizal fungi sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    click_on('Create Mycorrhizal fungi sample')
    expect(page).to have_selector '.alert', text: 'The form contains 7 errors.'
    page.find('.alert').tap do |error_explanations|
      expect(error_explanations).to have_content("Collection date can't be blank")
      expect(error_explanations).to have_content('Plot must exist')
      expect(error_explanations).to have_content('Plant must exist')
      expect(error_explanations).to have_content('Length is not a number')
      expect(error_explanations).to have_content('Magnification is not included in the list')
      expect(error_explanations).to have_content('Arbuscule count is not a number')
    end
  end

  scenario 'with no visible hyphae' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    select('Plant Example', from: 'Plant')
    fill_in('Length', with: 1)
    select('4x', from: 'Magnification')
    fill_in('Vesicle count', with: '100')
    fill_in('Arbuscule count', with: '100')
    click_on('Create Mycorrhizal fungi sample')
    expect(page).to have_content('Mycorrhizal fungi sample was successfully created')
  end

end
