require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "adding new user" do
    user = User.new(first_name: 'Pat', last_name: 'Mattox', net_id: 'heymonheyman', is_admin: false, provider: 'saml')
    assert_equal 'Pat', user.first_name
    assert_equal 'Mattox', user.last_name
    assert_equal 'heymonheyman', user.net_id
    assert_equal 'saml', user.provider
    assert_equal false, user.is_admin
  end

  test "find user by net_id" do
    user = User.where(["net_id = ?", 'tparri2']).first
    assert_equal 'Terry', user.first_name
    assert_equal 'Parrish', user.last_name
    assert_equal 'tparri2', user.net_id
    assert_equal 'saml', user.provider
    assert_equal false, user.is_admin
  end

  test "update user from not admin to admin" do
    user = User.where(["net_id = ?", 'tparri2']).first
    assert_equal false, user.is_admin
    User.where(["net_id = ?", 'tparri2']).update_all(:is_admin => true)
    user = User.where(["net_id = ?", 'tparri2']).first
    assert_equal true, user.is_admin
  end

  test "update user from admin to not admin" do
    user = User.where(["net_id = ?", 'sbarre5']).first
    assert_equal true, user.is_admin
    User.where(["net_id = ?", 'sbarre5']).update_all(:is_admin => false)
    user = User.where(["net_id = ?", 'sbarre5']).first
    assert_equal false, user.is_admin
  end
end
