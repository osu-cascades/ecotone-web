class Plant < ApplicationRecord
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :description, presence: true
  validates :habitat_type, presence: true
  validates :sunlight_tolerance, presence: true

  has_attached_file :photo, default_url: "missing.png", styles: { default: "200x200#", thumbnail: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage/

end
