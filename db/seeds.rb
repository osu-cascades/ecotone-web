
user = User.create!( name:  "Administrator",
                     email: "admin@example.com",
                     password:              "password",
                     password_confirmation: "password")
user.toggle!(:admin)