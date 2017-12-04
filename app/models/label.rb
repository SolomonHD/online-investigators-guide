class Label < ApplicationRecord
  has_and_belongs_to_many :pages, dependent: :destroy
  has_many :answers_labels, :class_name => 'AnswersLabel'
  has_many :answers, dependent: :destroy, through: :answers_labels

  validates_uniqueness_of :name, :message => '%{value} has already been taken'
end
