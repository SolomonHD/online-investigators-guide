require 'test_helper'

class Admin::SiteInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_site_information = admin_site_informations(:one)
  end

  test "should get index" do
    get admin_site_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_site_information_url
    assert_response :success
  end

  test "should create admin_site_information" do
    assert_difference('Admin::SiteInformation.count') do
      post admin_site_informations_url, params: { admin_site_information: {  } }
    end

    assert_redirected_to admin_site_information_url(Admin::SiteInformation.last)
  end

  test "should show admin_site_information" do
    get admin_site_information_url(@admin_site_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_site_information_url(@admin_site_information)
    assert_response :success
  end

  test "should update admin_site_information" do
    patch admin_site_information_url(@admin_site_information), params: { admin_site_information: {  } }
    assert_redirected_to admin_site_information_url(@admin_site_information)
  end

  test "should destroy admin_site_information" do
    assert_difference('Admin::SiteInformation.count', -1) do
      delete admin_site_information_url(@admin_site_information)
    end

    assert_redirected_to admin_site_informations_url
  end
end
