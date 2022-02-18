class Map < ApplicationRecord

  attr_reader :longitude, :latitude, :plots
  has many :plots

end