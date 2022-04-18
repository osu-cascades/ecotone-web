
20.times do |plant|
    Plant.create!(
        common_name: "Lorem Ipsum#{plant}",
        scientific_name: "Lorem ipsum#{plant}",
        description: "Lorem ipsum dolor sit amet, consectetur 
        adipiscing elit, sed do eiusmod tempor incididunt ut 
            labore et dolore magna aliqua. Ut enim ad minim 
            veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat.",
        habitat_type: "Lorem ipsum dolor sit amet.",
        tolerance: "Lorem ipsum dolor sit amet."
    )
        end