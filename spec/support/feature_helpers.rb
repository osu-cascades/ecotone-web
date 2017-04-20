# http://stackoverflow.com/questions/38906811/rspec-rails-4-access-current-user-from-rspec-feature-spec
module FeatureHelpers

  def sign_in(user)
    visit login_path
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => user.password)
    click_button("login-btn")
  end

end
