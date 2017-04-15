FactoryGirl.define do
  factory :user do
    name "Nathan Struhs"
    email "nathanstruhs@gmail.com"
    #password_digest: { User.digest('password') }
  end
end