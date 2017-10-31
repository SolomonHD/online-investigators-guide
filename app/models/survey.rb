class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :survey_template
  has_and_belongs_to_many :answers
end
