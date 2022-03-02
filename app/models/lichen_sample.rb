class LichenSample < ApplicationRecord
  belongs_to :plot
  belongs_to :user
  has_and_belongs_to_many :biodiversity_reports

  validates :collected_on, presence: true
  validates :location_within_plot, presence: true
  validates :description, presence: true

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

end
