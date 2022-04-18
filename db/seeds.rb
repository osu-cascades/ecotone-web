
1.upto(20) do |num|

    user_num = num + 1
    User.create!(
        id: user_num,
        name:  "Person#{num}",
        email: "person_#{num}@example#{num}.com",
        password:              "password",
        password_confirmation: "password",
        admin: false )

    Plant.create!(
        common_name: "Plant ##{num}",
        scientific_name: "Plant ##{num}",
        description: "Lorem ipsum dolor sit amet, consectetur 
            adipiscing elit, sed do eiusmod tempor incididunt ut 
            labore et dolore magna aliqua. Ut enim ad minim 
            veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat.",
        habitat_type: "Lorem ipsum dolor sit amet.",
        tolerance: "Lorem ipsum dolor sit amet."
    )

    Plot.create!(
        plot_id: num,
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
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num,
        location_within_plot: "Lorem ipsum dolor sit amet.",
        size: 10,
        description: "Lorem ipsum dolor sit amet."
    )

    LichenSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num,
        location_within_plot: "Lorem ipsum dolor sit amet.",
        description: "Lorem ipsum dolor sit amet."
    )

    MacroinvertebrateSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num,
        phylum: "Lorem ipsum",
        location_within_plot: "Lorem ipsum dolor sit amet.",
        quantity: "1",
        ecosystem_service: "Consumer" 
    )

    MycorrhizalFungiSample.create!(
        collected_on: "#01/06/2022", 
        length: 1, 
        magnification: 40, 
        vesicle_count: 1, 
        arbuscule_count: 1,
        visible_hyphae: "Yes", 
        hyphae_coverage: 1, 
        user_id: user_num, 
        plot_id: num, 
        plant_id: num    
    )

    NonvascularPlantSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num, 
        location_within_plot: "Lorem ipsum dolor sit amet.",
        description: "Lorem ipsum dolor sit amet."
    )

    PlantSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        abundance: 5,
        percent_cover: 5,
        biomass_estimate: 5,
        plant_id: num, 
        plot_id: num
    )

    SoilSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num, 
        collection_method: "composite",
        ph_level: 7,
        temperature: 45,
        moisture: 6,
       # add nutrient attributes
    )

    SpeciesVariationObservation.create!(
        user: User.find(user_num),
        observed_on: "#01/06/2022",
        plot_id: num, 
        plant_id: num, 
        average_height: 2,
        average_width: 2,
        description: "Lorem ipsum dolor sit amet."
    )

    TreeSample.create!(
        user: User.find(user_num),
        collected_on: "#01/06/2022",
        plot_id: num, 
        plant_id: num, 
        tag_number: 105,
        growth_stage: 2,
        dbh: 45,
        lower_canopy_height: 35,
        upper_canopy_height: 55,
        latitude: 45,
        longitude: 121
    )

    BiodiversityReport.create!(
        author: User.find(user_num),
        measured_on: "#01/06/2022",
        plot_id: num,
        temperature: 51,
        species_richness: 34, 
        species_evenness: 0.1, 
        biomass_estimate: 0.1,
        diversity_index: 1
    )
        end