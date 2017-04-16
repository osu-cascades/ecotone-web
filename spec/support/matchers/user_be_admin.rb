RSpec::Matchers.define :be_admin do
  match do |actual|
    actual.admin
  end
end