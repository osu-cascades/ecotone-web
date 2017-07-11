require 'rails_helper'

RSpec.feature 'user views plant samples reports' do

  let(:user) { create(:user) }
  let(:biodiversity_report) { create(:biodiversity_report) }

  before do
    sign_in(user)
    visit plant_samples_path
  end

  scenario 'user has valid permissions' do
    expect(page).to have_content('Plant Samples')
  end

end