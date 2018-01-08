require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  test "adding new label" do
    label = Label.new(name: 'My Label')
    assert_equal 'My Label', label.name
  end

  test "find label by id" do
    label = Label.where(["id = ?", labels(:one).id]).first
    assert_equal 'Humans', label.name
  end
end
