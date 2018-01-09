class SurveyTemplate < ApplicationRecord
  # the name is mandatory
  validates_presence_of :name
  validates_presence_of :questions

  has_many :questions, dependent: :destroy
  has_many :surveys

  has_many :answers_label

  accepts_nested_attributes_for :questions, allow_destroy: true
end
