class Page < ApplicationRecord
  has_ancestry :cache_depth => true
  has_and_belongs_to_many :labels
end
