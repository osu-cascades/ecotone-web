class MacroinvertebrateSample < ApplicationRecord
  belongs_to :biodiversity_report

  validates :phylum, presence: true
  validates :location_within_plot, presence: true
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates :ecosystem_service, presence: true, inclusion: { in: %w(pollinator consumer decomposer),
                                                             message: "%{value} is not a valid ecosystem_service"}

  has_attached_file :photo, default_url: "missing.png", styles: { default: "200x200#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/
end
