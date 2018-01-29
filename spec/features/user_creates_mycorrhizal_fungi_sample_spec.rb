require 'rails_helper'

RSpec.feature 'User creates a mycorrhizal fungi sample' do
  let(:user) { create(:user) }

  before do
    create(:plot)
    sign_in(user)
    visit new_mycorrhizal_fungi_sample_path
  end

  scenario 'with valid sample attributes' do

  end

  scenario 'with invalid sample attributes' do

  end

end
