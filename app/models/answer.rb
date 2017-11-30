class Answer < ApplicationRecord
  # the content is mandatory
  validates_presence_of :content

  belongs_to :question
  has_and_belongs_to_many :surveys
  has_many :answers_labels, :class_name => 'AnswersLabel'
  has_and_belongs_to_many :labels
  # has_many :labels, through: :answers_labels

end
