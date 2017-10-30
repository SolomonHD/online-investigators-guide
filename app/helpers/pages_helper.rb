module PagesHelper
  def nested_pages(pages)
    pages.map do |page, sub_pages|
      render(page) + nested_pages(sub_pages)
    end.join.html_safe
  end
end
