class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    # Remove all broken links in database
    Admin::BrokenLink.delete_all

    require 'mechanize'

    puts Rails.env


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
          begin
           l.click.code.to_s
          # PREVENT ERRORS AND WRITE TO DATABASE
          rescue Errno::EINVAL,
            Errno::ECONNRESET,
            EOFError,
            Net::HTTPBadResponse,
            Net::HTTPHeaderSyntaxError,
            Net::ProtocolError,
            Net::OpenTimeout,
            Net::HTTPServerException,
            Net::HTTPFatalError,
            Mechanize::ResponseCodeError,
            OpenSSL::SSL::SSLError,
            Errno::EHOSTUNREACH,
            Mechanize::Error,
            Net::HTTP::Persistent::Error,
            SocketError,
            Net::HTTPRetriableError => e
              case e.response_code
                when "404"
                  # REMOVE LOGIN INFORMATION FROM BROKEN LINK REPORT
                  if !l.href.include?("auth/") and !l.text.include?("Log In")
                   Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: e.response_code, link_error: e)
                  end
                  next # If the page can not be found next
                when "502"
                  retry # another time when you can not access it well!
                else
                  retry
                end
          rescue SocketError => e
            Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: 443, link_error: e)
          rescue OpenSSL::SSL::SSLError => e
            Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: 509, link_error: e)
          rescue Mechanize::ResponseCodeError => e

          end
        end
    end
    # IF NO DEADLINKS, RUN NULLSET FOR UPDATED TIME
    if Admin::BrokenLink.count == 0
      Admin::BrokenLink.create(page_id:null)
    end
  end
end
