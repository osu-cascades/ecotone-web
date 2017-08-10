class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.communicate_present_attributes(excluding:)
    define_method('has_any_present_attributes?') do
      attributes.each { |name, value| return true if name != excluding && value.present? }
      return false
    end
  end

end
