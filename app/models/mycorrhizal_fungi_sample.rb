class MycorrhizalFungiSample < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  belongs_to :plant

  validates_presence_of :collected_on
  validates_numericality_of :length, only_integer: true, greater_than: 0
  validates_numericality_of :magnification, only_integer: true
  validates_inclusion_of :magnification, in: [4, 10, 40]
  validates_numericality_of :vesicle_count, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :arbuscule_count, only_integer: true, greater_than_or_equal_to: 0
  validates_inclusion_of :visible_hyphae, in: [true, false]
  validates_numericality_of :hyphae_coverage, if: :has_visible_hyphae?, only_integer: true, greater_than: 0, less_than_or_equal_to: 100

  def has_visible_hyphae?
    visible_hyphae
  end

  def to_s
    "#{plot}, #{plant}, on #{collected_on} by #{user}"
  end

end
