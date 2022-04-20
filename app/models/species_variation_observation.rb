class SpeciesVariationObservation < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  belongs_to :plant
  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  validates :observed_on, presence: true
  validates_numericality_of :average_height, greater_than_or_equal_to: 0
  validates_numericality_of :average_width, greater_than_or_equal_to: 0

  paginates_per 10

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    observed_on&.to_formatted_s(:long)
  end

  def to_s
    "#{plant} in #{plot} on #{observed_on} by #{user}"
  end

end
