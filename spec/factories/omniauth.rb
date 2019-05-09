FactoryBot.define do
  factory :auth_hash, class: OmniAuth::AuthHash do
    initialize_with do
      OmniAuth::AuthHash.new({
        provider: 'google',
        uid: 'abc123',
        info: {
          email: email,
          name: name
        },
        extra: {
          raw_info: {
            hd: hd
          }
        }
      })
    end

    trait :authorized_domain do
      email { 'example@example.com' }
      name { 'Example Valid User' }
      hd { 'example.com' }
    end

    trait :unauthorized_domain do
      email { 'example@fake.com' }
      name { 'Example Invalid User' }
      hd { 'fake.com' }
    end
  end
end
