class AnswersSurvey < ApplicationRecord
  belongs_to :surveys
  belongs_to :answers
end
