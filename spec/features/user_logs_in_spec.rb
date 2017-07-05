require 'rails_helper'

RSpec.feature "User logs in" do

  let(:user) { create(:user) }

  scenario "fails when providing invalid credentials" do
    visit login_path
    fill_in('Email', with: '')
    fill_in('Password', with: '')
    click_button("login-btn")
    expect(page).to have_content("Log in")
    expect(page).to have_selector ".alert", text: "Invalid email/password combination"
    # ensure the flash does not persist after visiting any subsequent screens
    visit root_path
    expect(page).to have_no_selector ".alert"
  end

  scenario "succeeds providing valid credentials" do
    sign_in(user)
    expect(page).to have_selector ".alert", text: "Welcome back, #{user.name}"
  end

end
