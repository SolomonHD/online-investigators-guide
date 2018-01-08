require 'test_helper'

class QuestionTypeTest < ActiveSupport::TestCase
  test "get question type by id" do
    question_type = QuestionType.new(name: 'combobox', label: 'one')
    assert_equal 'combobox', question_type.name
    assert_equal 'one', question_type.label
  end

  test "get question type by count" do
    question_type = QuestionType.all
    assert_equal 2, question_type.count
  end
end
