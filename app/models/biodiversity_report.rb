class BiodiversityReport < ApplicationRecord
  belongs_to :user
  belongs_to :plot

  has_many :plant_samples, :inverse_of => :biodiversity_report
  accepts_nested_attributes_for :plant_samples

  has_one :soil_sample
  accepts_nested_attributes_for :soil_sample

  has_attached_file :photo, default_url: "missing.png", styles: { default: "400x400#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

  def to_s
    "Biodiversity Report #{id}"
  end

  def byline
    "by #{user} on #{date.to_s(:long)} at #{time.to_s(:ampm)}"
  end

  def editable_by?(user)
    user.admin? || user == self.user
  end

end

