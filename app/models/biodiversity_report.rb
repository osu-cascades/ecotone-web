class BiodiversityReport < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :plot

  has_and_belongs_to_many :soil_samples
  has_and_belongs_to_many :lichen_samples
  has_and_belongs_to_many :macroinvertebrate_samples

  has_many :plant_samples
  accepts_nested_attributes_for :plant_samples, allow_destroy: true, reject_if: :all_blank

  has_attached_file :photo, default_url: 'missing.png', styles: { default: '400x400#', thumbnail: '50x50#' }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  validates_presence_of :measured_on
  validates_presence_of :measured_at
  validates_numericality_of :temperature, allow_nil: true
  validates_numericality_of :species_richness, only_integer: true, greater_than: 0
  validates_numericality_of :diversity_index, greater_than: 0
  validates_numericality_of :species_evenness, greater_than_or_equal_to: 0, less_than_or_equal_to: 1, allow_nil: true

  after_destroy :destroy_associated_samples

  paginates_per 10

  def to_s
    "Biodiversity Report #{id}"
  end

  def byline
    "by #{author} on #{measured_on.to_s(:long)} at #{measured_at.to_s(:ampm)}"
  end

  def destroy_associated_samples
    plant_samples.each(&:destroy)
  end

  def user
    author
  end

end
