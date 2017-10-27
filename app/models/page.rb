class Page < ApplicationRecord
  has_ancestry
  has_and_belongs_to_many :labels
end
