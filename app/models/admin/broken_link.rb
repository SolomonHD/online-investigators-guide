class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    # Remove all broken links in database
    Admin::BrokenLink.delete_all

    require 'mechanize'

    # Mechanize
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'

    if Rails.env.local?
      page = agent.get('https://oig-dev.emory.edu/sitemap')
    elsif Rails.env.dev?
      page = agent.get('https://oig-qa.emory.edu/sitemap')
    elsif Rails.env.qa?
      page = agent.get('https://oig-qa.emory.edu/sitemap')
    else
      page = agent.get('https://oig-qa.emory.edu/sitemap')
    end

    # GET PAGES FROM SITEMAP
    page.links_with(href: %r{.*/pages/\w+}).each do |link|
      # FETCH URL USING MECHANIZE AGENT
      internalPage = agent.get(link.href)
        # GET ALL LINKS ON URL
        internalPage.links.each do |l|
          begin
           l.click.code.to_s
          # PREVENT ERRORS AND WRITE TO DATABASE
          rescue Mechanize::ResponseCodeError => e
            case e.response_code
              when "404"
                # REMOVE LOGIN INFORMATION FROM BROKEN LINK REPORT
                if !l.href.include?("auth/") and !l.text.include?("Log In")
                 Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: e.response_code)
                end
                next # If the page can not be found next
              when "502"
                retry # another time when you can not access it well!
              else
                retry
              end
          end
        end
    end
    # IF NO DEADLINKS, RUN NULLSET FOR UPDATED TIME
    if Admin::BrokenLink.count == 0
      Admin::BrokenLink.create(page_id:null)
    end
  end
end
