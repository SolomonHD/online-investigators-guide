require 'test_helper'

class Admin::SupportingUnitTest < ActiveSupport::TestCase
  test "adding new supporting unit" do
    admin_supporting_unit = Admin::SupportingUnit.new(unit: 'OIG', title: 'Online Investigators Guide', url: 'www.oig.com')
    assert_equal 'OIG', admin_supporting_unit.unit
    assert_equal 'Online Investigators Guide', admin_supporting_unit.title
    assert_equal 'www.oig.com', admin_supporting_unit.url
  end

  test "find supporting unit by id" do
    admin_supporting_unit = admin_supporting_units(:one)
    assert_equal 'IMS', admin_supporting_unit.unit
    assert_equal 'IMS', admin_supporting_unit.title
    assert_equal 'www.ims.com', admin_supporting_unit.url
  end
end
