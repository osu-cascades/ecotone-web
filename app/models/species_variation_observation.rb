class SpeciesVariationObservation < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  belongs_to :plant
  has_attached_file :photo, default_url: 'missing.png', styles: { default: '200x200#', thumbnail: '50x50#' }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  validates :observed_on, presence: true
  validates_numericality_of :average_height, greater_than_or_equal_to: 0
  validates_numericality_of :average_width, greater_than_or_equal_to: 0

  def to_s
    "#{plant} in #{plot} on #{observed_on} by #{user}"
  end

end
