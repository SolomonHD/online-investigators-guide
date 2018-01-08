require 'test_helper'

class SurveyTemplateTest < ActiveSupport::TestCase
  test "adding new survey" do
    survey_template = SurveyTemplate.new(name: 'My Survey Template', is_default: 'false')
    assert_equal 'My Survey Template', survey_template.name
    assert_equal false, survey_template.is_default
  end

  test "find survey template by id" do
    survey_template = SurveyTemplate.where(["id = ?", survey_templates(:one).id]).first
    assert_equal 'Humans Template', survey_template.name
    assert_equal true, survey_template.is_default
  end

  test "update survey template from not is_default to is_default" do
    survey_template = SurveyTemplate.where(["id = ?", survey_templates(:two).id]).first
    assert_equal false, survey_template.is_default
    SurveyTemplate.where(["id = ?", survey_templates(:two).id]).update_all(:is_default => true)
    survey_template = SurveyTemplate.where(["id = ?", survey_templates(:two).id]).first
    assert_equal true, survey_template.is_default
  end

  test "update survey template from is_default to not is_default" do
    survey_template = SurveyTemplate.where(["id = ?", survey_templates(:one).id]).first
    assert_equal true, survey_template.is_default
    SurveyTemplate.where(["id = ?", survey_templates(:one).id]).update_all(:is_default => false)
    survey_template = SurveyTemplate.where(["id = ?", survey_templates(:one).id]).first
    assert_equal false, survey_template.is_default
  end
end
