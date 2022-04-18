
20.times do |num|

    User.create!(
        name:  "Person#{num}",
        email: "person_#{num}@example.com",
        password:              "password",
        password_confirmation: "password",
        admin: false )

    Plant.create!(
        common_name: "Lorem Ipsum#{num}",
        scientific_name: "Lorem ipsum#{num}",
        description: "Lorem ipsum dolor sit amet, consectetur 
        adipiscing elit, sed do eiusmod tempor incididunt ut 
            labore et dolore magna aliqua. Ut enim ad minim 
            veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat.",
        habitat_type: "Lorem ipsum dolor sit amet.",
        tolerance: "Lorem ipsum dolor sit amet."
    )

    Plot.create!(
        plot_id: "#{num}",
        featured_plant_id: 1,
        latitude: 44,
        longitude: 121,
        location_description: "Lorem ipsum dolor sit amet, consectetur 
        adipiscing elit, sed do eiusmod tempor incididunt ut 
            labore et dolore magna aliqua.",
        elevation: 3684,
        area: 300,
        aspect: "North facing",
        origin: "Nursery",
        initial_planting_date: "Spring 2017",
        initial_succession: "Primary"
    )
        end