require 'test_helper'

class Admin::SiteInformationTest < ActiveSupport::TestCase
  test "adding new site information" do
    admin_site_information = Admin::SiteInformation.new(name: 'This is my name',
      text: 'This is my title', header: 'This is my header', isOn: false)
    assert_equal 'This is my name', admin_site_information.name
    assert_equal 'This is my title', admin_site_information.text
    assert_equal 'This is my header', admin_site_information.header
    assert_equal false, admin_site_information.isOn
  end

  test "find site information by id" do
    admin_site_information = admin_site_informations(:one)
    assert_equal 'My First Info', admin_site_information.name
    assert_equal 'This is a test', admin_site_information.text
    assert_equal 'This is my header', admin_site_information.header
    assert_equal true, admin_site_information.isOn
  end
end
