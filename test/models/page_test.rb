require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "adding new page" do
    page = Page.new(title: 'My Page', header: 'My Header', body: 'My body',
      ancestry_depth: 0, is_numbered: 0, position: 1)
    assert_equal 'My Page', page.title
    assert_equal 'My Header', page.header
    assert_equal 'My body', page.body
    assert_equal false, page.is_numbered
    assert_equal 1, page.position
  end

  test "find page by id" do
    page = Page.where(["id = ?", pages(:one).id]).first
    assert_equal 'My First Page', page.title
    assert_equal 'My First Header', page.header
    assert_equal '<div>This is the body.</div>', page.body
    assert_equal false, page.is_numbered
    assert_equal 1, page.position
  end
end
