class ApplicationRecord < ActiveRecord::Base
  include AttributePresence
  self.abstract_class = true
end
