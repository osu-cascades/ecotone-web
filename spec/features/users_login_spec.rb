require 'rails_helper'

RSpec.describe "user log in" do

  context "when not logged in" do

    it "provides invalid credentials" do
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

    it "provides valid credentials" do
      user = create(:user)
      sign_in(user)
      expect(page).to have_selector ".alert", text: "Welcome back, #{user.name}"
    end

  end

  context "when logged in" do

    let(:user) { create(:user) }
    before { sign_in(user) }

    it "logs out" do
      expect(page).to have_no_link "Log in"
      expect(page).to have_link "Log out"
      click_link "Log out"
      expect(page).to have_no_link "Log out"
      expect(page).to have_link "Log in"
      expect(page).to have_selector ".alert", text: "You have logged out."
    end
  end

end
