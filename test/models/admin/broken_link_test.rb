require 'test_helper'

class Admin::BrokenLinkTest < ActiveSupport::TestCase
  test "adding new broken link" do
    admin_broken_link = Admin::BrokenLink.new(link_text: 'Link Text', page_title: 'Page Title',
      page_id: '10', broken_url: 'www.foo.com', link_status: 'failure', link_error: 'Page Not Found')
    assert_equal 'Link Text', admin_broken_link.link_text
    assert_equal 'Page Title', admin_broken_link.page_title
    assert_equal '10', admin_broken_link.page_id
    assert_equal 'www.foo.com', admin_broken_link.broken_url
    assert_equal 'failure', admin_broken_link.link_status
    assert_equal 'Page Not Found', admin_broken_link.link_error
  end

  test "find broken link by id" do
    admin_broken_link = admin_broken_links(:one)
    assert_equal 'This is my link text', admin_broken_link.link_text
    assert_equal 'This is my page title', admin_broken_link.page_title
    assert_equal '20', admin_broken_link.page_id
    assert_equal 'www.google.com', admin_broken_link.broken_url
    assert_equal 'error', admin_broken_link.link_status
    assert_equal 'Page Not Found', admin_broken_link.link_error
  end
end
