class MycorrhizalFungiSample < ApplicationRecord
  MAGNIFICATIONS = {'4x': 4, '10x': 10, '40x': 40}

  belongs_to :user
  belongs_to :plot
  belongs_to :plant

  validates_presence_of :collected_on, message: "Collection Date can't be blank"
  validates_numericality_of :length, only_integer: true, greater_than: 0
  validates_inclusion_of :magnification, in: MAGNIFICATIONS.values
  validates_numericality_of :vesicle_count, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :arbuscule_count, only_integer: true, greater_than_or_equal_to: 0
  validates_inclusion_of :visible_hyphae, in: [true, false]
  validates_numericality_of :hyphae_coverage, if: :has_visible_hyphae?, only_integer: true, greater_than: 0, less_than_or_equal_to: 100

  has_many_attached :photo
  validates :photo, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  paginates_per 10

  def has_visible_hyphae?
    visible_hyphae
  end

  def updated_string
    updated_at&.to_formatted_s(:long)
  end 

  def datestamp
    collected_on&.to_formatted_s(:long)
  end

  def to_s
    "#{plot}, #{plant}, on #{collected_on} by #{user}"
  end

end
