class Answer < ApplicationRecord
  # the content is mandatory
  validates_presence_of :content

  belongs_to :question
  has_and_belongs_to_many :surveys
  has_many :answers_labels, :class_name => 'AnswersLabel'
  has_many :labels, through: :answers_labels

end
