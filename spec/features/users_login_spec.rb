require 'rails_helper'

RSpec.describe "user log in" do
  it "rejects invalid login credentials" do
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

  # it "accepts valid login credentials" do
  #   user = FactoryGirl.build_stubbed(:user, name: "Nathan Struhs", email: "nathanstruhs@gmail.com" password: "password")
  #   visit login_path
  #   fill_in('Email', :with => 'nathanstruhs@gmail.com')
  #   fill_in('Password', :with => 'password')

  # end
end
