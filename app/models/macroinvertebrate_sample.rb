class MacroinvertebrateSample < ApplicationRecord
  ECOSYSTEM_SERVICES = %w[Pollinator Consumer Decomposer]

  belongs_to :plot
  belongs_to :user
  has_and_belongs_to_many :biodiversity_reports

  validates :collected_on, presence: true
  validates :phylum, presence: true
  validates :location_within_plot, presence: true
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates :ecosystem_service, presence: true, inclusion: { in: ECOSYSTEM_SERVICES,
                                                             message: '%{value} is not a valid ecosystem service' }
  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  paginates_per 10
  
  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    collected_on&.to_formatted_s(:long)
  end

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

end
