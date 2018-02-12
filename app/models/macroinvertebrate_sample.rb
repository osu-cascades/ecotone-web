class MacroinvertebrateSample < ApplicationRecord
  ECOSYSTEM_SERVICES = %w[Pollinator Consumer Decomposer]

  belongs_to :plot
  belongs_to :user
  belongs_to :biodiversity_report

  validates :collected_on, presence: true
  validates :phylum, presence: true
  validates :location_within_plot, presence: true
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates :ecosystem_service, presence: true, inclusion: { in: ECOSYSTEM_SERVICES,
                                                             message: '%{value} is not a valid ecosystem service' }

  has_attached_file :photo, default_url: 'missing.png', styles: { default: '200x200#', thumbnail: '50x50#' }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  ignores_present_attributes exclude: 'biodiversity_report_id'
end
