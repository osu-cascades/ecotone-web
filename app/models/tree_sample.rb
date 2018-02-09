class TreeSample < ApplicationRecord

  enum growth_stage: { # This is more future-proof. Don't use [:composite, :point].
    seedling: 2,
    sapling: 4,
    adult: 6
  }

  belongs_to :plot
  belongs_to :plant
  belongs_to :user

  validates :collected_on, presence: true
  validates_numericality_of :tag_number, only_integer: true, greater_than: 0
  validates_presence_of :growth_stage
  validates_numericality_of :dbh, greater_than: 0
  validates_numericality_of :lower_canopy_height, greater_than: 0
  validates_numericality_of :upper_canopy_height, greater_than: 0
  validates_numericality_of :latitude
  validates_numericality_of :longitude

  has_attached_file :photo, default_url: 'missing.png', styles: { default: '200x200#', thumbnail: '50x50#' }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  def to_s
    "#{plant} in #{plot} on #{collected_on} by #{user}"
  end

end
