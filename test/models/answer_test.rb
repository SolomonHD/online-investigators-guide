require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "adding new answer" do
    answer = Answer.new(question_id: questions(:one).id, content: 'This is my answer')
    assert_equal 'This is my answer', answer.content
    assert_equal answer.question_id, questions(:one).id
  end

  test "find answer by id" do
    answer = Answer.where(["id = ?", answers(:one).id]).first
    assert_equal '9', answer.content
    assert_equal questions(:one).id, answer.question_id
  end
end
