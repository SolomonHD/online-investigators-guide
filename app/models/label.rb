class Label < ApplicationRecord
  has_and_belongs_to_many :pages, dependent: :destroy
  validates_uniqueness_of :name, :message => '%{value} has already been taken'
end
