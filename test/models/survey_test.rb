require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "adding new survey" do
    survey_template = survey_templates(:one)
    user = users(:one)
    survey = Survey.new(name: 'My Survey', description: 'This is my first survey', user_id: user.id, survey_template_id: survey_template.id, is_default: 'false')
    assert_equal 'My Survey', survey.name
    assert_equal 'This is my first survey', survey.description
    assert_equal user.id, survey.user_id
    assert_equal survey_template.id, survey.survey_template_id
    assert_equal false, survey.is_default
  end

  test "find survey by id" do
    survey = Survey.where(["id = ?", surveys(:one).id]).first
    assert_equal 'Human Study', survey.name
    assert_equal 'This research is for humans', survey.description
    assert_equal false, survey.is_default
  end

  test "update survey from not is_default to is_default" do
    survey = Survey.where(["id = ?", surveys(:one).id]).first
    assert_equal false, survey.is_default
    Survey.where(["id = ?", surveys(:one).id]).update_all(:is_default => true)
    survey = Survey.where(["id = ?", surveys(:one).id]).first
    assert_equal true, survey.is_default
  end

  test "update survey from is_default to not is_default" do
    survey = Survey.where(["id = ?", surveys(:two).id]).first
    assert_equal true, survey.is_default
    Survey.where(["id = ?", surveys(:two).id]).update_all(:is_default => false)
    survey = Survey.where(["id = ?", surveys(:two).id]).first
    assert_equal false, survey.is_default
  end
end
