class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ignores_present_attributes(exclude:)
    define_method('has_any_present_attributes?') do
      attributes.each { |name, value| return true if name != exclude && value.present? }
      return false
    end
  end

  def editable_by?(user)
    !user.nil? && (user.admin? || user == self.user)
  end

end
