class Question < ApplicationRecord
  # the content is mandatory
  validates_presence_of :content

  has_many :answers
  belongs_to :survey_template
  has_one :question_type
  accepts_nested_attributes_for :answers, allow_destroy: true
end
