class Plot < ApplicationRecord
validates :plot_id, presence: true
validates :latitude, presence: true
validates :longitude, presence: true
validates :elevation, presence: true
validates :area, presence: true
validates :location_description, presence: true
validates :aspect, presence: true
validates :origin, presence: true
validates :initial_planting_date, presence: true
validates :initial_succession, presence: true
validates :photo, presence: true
end
