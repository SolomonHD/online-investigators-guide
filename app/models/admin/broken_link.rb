class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    # Remove all broken links in database
    Admin::BrokenLink.delete_all

    require 'mechanize'

    # Mechanize
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    agent.follow_meta_refresh = true
    agent.request_headers = {'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'}

    if Rails.env == 'local' || Rails.env == 'development'
      page = agent.get('https://oig-dev.emory.edu/sitemap')
    else
      page = agent.get('https://oig-qa.emory.edu/sitemap')
    end

    # GET PAGES FROM SITEMAP
    page.links_with(href: %r{.*/pages/\w+}).each do |link|
      # FETCH URL USING MECHANIZE AGENT
      internalPage = agent.get(link.href)
        # GET ALL LINKS ON URL
        internalPage.links.each do |l|
          puts l.href
          begin
           l.click.code.to_s
           # PREVENT ERRORS AND WRITE TO DATABASE
        end
    end
    # IF NO DEADLINKS, RUN NULLSET FOR UPDATED TIME
    if Admin::BrokenLink.count == 0
      Admin::BrokenLink.create()
    end

end
