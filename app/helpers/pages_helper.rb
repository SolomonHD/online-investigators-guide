module PagesHelper
  def nested_pages(pages)
    pages.map do |page, sub_pages|
      render(page) + content_tag(:section, nested_pages(sub_pages), :class => "column is-12")
    end.join.html_safe
  end
end
