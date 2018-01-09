class Question < ApplicationRecord
  # the content is mandatory
  validates_presence_of :content
  validates_presence_of :answers
  
  has_many :answers, dependent: :destroy
  belongs_to :survey_template
  belongs_to :question_type
  accepts_nested_attributes_for :answers, allow_destroy: true
end
