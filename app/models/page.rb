class Page < ApplicationRecord
  has_ancestry :cache_depth => true
  acts_as_list scope: [:ancestry]
  has_and_belongs_to_many :labels

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end

end
