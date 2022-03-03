class FungiSample < ApplicationRecord

  belongs_to :user
  belongs_to :plot

  validates :collected_on, presence: true
  validates :location_within_plot, presence: true
  validates_numericality_of :size, greater_than_or_equal_to: 0
  validates :description, presence: true

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  def to_s
    "#{plot} on #{collected_on} by #{user}"
  end

end
