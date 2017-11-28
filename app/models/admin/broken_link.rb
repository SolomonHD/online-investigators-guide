class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    # Remove all broken links in database
    Admin::BrokenLink.delete_all

    require 'mechanize'

    # Mechanize
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = agent.get('https://oig-dev.emory.edu/sitemap')

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
                puts "caught Net :: HTTPNotFound!"
                # REMOVE LOGIN INFORMATION FROM BROKEN LINK REPORT
                puts l.text
                if !l.href.include?("auth/") and !l.text.include?("Log In")
                 Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: e.response_code)
                end
                next # If the page can not be found next
              when "502"
                puts "caught Net :: HTTPBadGateway!"
                retry # another time when you can not access it well!
              else
                puts "caught Excepcion!" + e.response_code
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
