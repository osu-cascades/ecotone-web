class FungiSample < ApplicationRecord

  belongs_to :user
  belongs_to :plot

  validates :collected_on, presence: true
  validates :location_within_plot, presence: true
  validates_numericality_of :size, greater_than_or_equal_to: 0
  validates :description, presence: true

  has_attached_file :photo, default_url: 'missing.png', styles: { default: '200x200#', thumbnail: '50x50#' }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

end
