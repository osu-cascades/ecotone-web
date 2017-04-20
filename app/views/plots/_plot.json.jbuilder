json.extract! plot, :id, :plot_id, :latitude, :longitude, :elevation, :area, :location_description, :aspect, :origin, :inoculated, :initial_planting_date, :initial_succession, :photo, :created_at, :updated_at
json.url plot_url(plot, format: :json)
