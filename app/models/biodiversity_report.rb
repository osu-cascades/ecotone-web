class BiodiversityReport < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :plot

  has_one :soil_sample
  accepts_nested_attributes_for :soil_sample, allow_destroy: true, reject_if: :all_blank

  has_one :fungi_sample
  accepts_nested_attributes_for :fungi_sample, allow_destroy: true, reject_if: :all_blank

  has_one :lichen_sample
  accepts_nested_attributes_for :lichen_sample, allow_destroy: true, reject_if: :all_blank

  has_one :nonvascular_plant_sample
  accepts_nested_attributes_for :nonvascular_plant_sample, allow_destroy: true, reject_if: :all_blank

  has_many :macroinvertebrate_samples
  accepts_nested_attributes_for :macroinvertebrate_samples, allow_destroy: true, reject_if: :all_blank

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

  def editable_by?(user)
    user.admin? || user == author
  end

  def destroy_associated_samples
    [soil_sample, fungi_sample, lichen_sample, nonvascular_plant_sample].each(&:destroy)
    macroinvertebrate_samples.each(&:destroy)
    plant_samples.each(&:destroy)
  end
end
