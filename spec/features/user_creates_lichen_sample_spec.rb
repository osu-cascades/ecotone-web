require 'rails_helper'

RSpec.feature 'User creates a lichen sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_lichen_sample_path
  end

  scenario 'with valid sample attributes' do
    fill_in('Collection date', with: '09/11/2001')
    select('Plot #1', from: 'Plot')
    fill_in('Location within plot', with: 'Fake location')
    fill_in('Description', with: 'Fake description')
    click_on('Create Lichen sample')
    expect(page).to have_content('Lichen sample was successfully created')
  end

  scenario 'with invalid sample attributes' do
    skip
  end

end
