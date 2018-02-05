class TreeSample < ApplicationRecord
  belongs_to :plot
  belongs_to :user
  belongs_to :plant
end
