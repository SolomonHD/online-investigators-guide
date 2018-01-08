require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "adding new question" do
    survey_template = survey_templates(:one)
    question_type = question_types(:one)
    question = Question.new(survey_template_id: survey_template.id, question_type_id: question_type.id, content: "This is my first question")
    assert_equal 'This is my first question', question.content
    assert_equal survey_template.id, question.survey_template_id
    assert_equal question_type.id, question.question_type_id
  end

  test "find question by id" do
    question = Question.where(["id = ?", questions(:one).id]).first
    assert_equal 'How many humans do you have in your research?', question.content
    assert_equal survey_templates(:one).id, question.survey_template_id
    assert_equal question_types(:one).id, question.question_type_id
  end
end
