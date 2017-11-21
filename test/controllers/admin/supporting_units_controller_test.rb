require 'test_helper'

class Admin::SupportingUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_supporting_unit = admin_supporting_units(:one)
  end

  test "should get index" do
    get admin_supporting_units_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_supporting_unit_url
    assert_response :success
  end

  test "should create admin_supporting_unit" do
    assert_difference('Admin::SupportingUnit.count') do
      post admin_supporting_units_url, params: { admin_supporting_unit: { title: @admin_supporting_unit.title, unit: @admin_supporting_unit.unit, url: @admin_supporting_unit.url } }
    end

    assert_redirected_to admin_supporting_unit_url(Admin::SupportingUnit.last)
  end

  test "should show admin_supporting_unit" do
    get admin_supporting_unit_url(@admin_supporting_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_supporting_unit_url(@admin_supporting_unit)
    assert_response :success
  end

  test "should update admin_supporting_unit" do
    patch admin_supporting_unit_url(@admin_supporting_unit), params: { admin_supporting_unit: { title: @admin_supporting_unit.title, unit: @admin_supporting_unit.unit, url: @admin_supporting_unit.url } }
    assert_redirected_to admin_supporting_unit_url(@admin_supporting_unit)
  end

  test "should destroy admin_supporting_unit" do
    assert_difference('Admin::SupportingUnit.count', -1) do
      delete admin_supporting_unit_url(@admin_supporting_unit)
    end

    assert_redirected_to admin_supporting_units_url
  end
end
