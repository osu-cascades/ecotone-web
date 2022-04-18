
20.times do |num|

    User.create!(
        id: num+2,
        name:  "Person#{num}",
        email: "person_#{num}@example#{num}.com",
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

    FungiSample.create!(
        user: User.find(num+2),
        collected_on: "#01/06/2022",
        plot_id: 1,
        location_within_plot: "Lorem ipsum dolor sit amet.",
        size: 10,
        description: "Lorem ipsum dolor sit amet."
    )
        end