require 'rails_helper'

RSpec.feature "Logging in" do

  let(:user) { create(:user) }

  scenario "User provides invalid credentials" do
    visit login_path
    fill_in('Email', :with => '')
    fill_in('Password', :with => '')
    click_button("login-btn")
    expect(page).to have_content("Log in")
    expect(page).to have_selector ".alert", text: "Invalid email/password combination"
    # ensure the flash does not persist after visiting any subsequent screens
    visit root_path
    expect(page).to_not have_selector ".alert"
  end

  scenario "User provides valid credentials" do
    sign_in(user)
    expect(page).to have_selector ".alert", text: "Welcome back, #{user.name}"
  end

end
