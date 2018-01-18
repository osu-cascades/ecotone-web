require 'rails_helper'

RSpec.feature 'User signs up' do
  before { visit signup_path }

  scenario 'providing invalid signup information' do
    skip 'user login temporarily disabled'
    fill_in('Name', with: '')
    fill_in('Email', with: 'user@invalid')
    fill_in('Password', with: 'a')
    fill_in('Confirm Password', with: 'z')
    click_on('Create my account')
    expect(page).to have_content('error')
  end

  scenario 'providing valid signup information' do
    skip 'user login temporarily disabled'
    fill_in('Name', with: 'Valid User')
    fill_in('Email', with: 'example@example.com')
    fill_in('Password', with: 'password')
    fill_in('Confirm Password', with: 'password')
    click_on('Create my account')
    expect(page).to have_content('Welcome')
  end
end
