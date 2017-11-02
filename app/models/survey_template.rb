class SurveyTemplate < ApplicationRecord
  # the name is mandatory
  validates_presence_of :name

  has_many :questions
  has_many :surveys

  accepts_nested_attributes_for :questions, allow_destroy: true
end