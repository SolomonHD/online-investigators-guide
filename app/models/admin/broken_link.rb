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

    if Rails.env == 'local'
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
         rescue  SocketError => e
           Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: 0, link_error: e)
         rescue Net::HTTPServerException, OpenSSL::SSL::SSLError => e
            # DO NOTHING
          rescue Errno::EINVAL,
            Errno::ECONNRESET,
            EOFError,
            Net::HTTPBadResponse,
            Net::HTTPHeaderSyntaxError,
            Net::ProtocolError,
            Net::OpenTimeout,
            Net::HTTPFatalError,
            Mechanize::ResponseCodeError,
            Errno::EHOSTUNREACH,
            Mechanize::Error,
            Net::HTTP::Persistent::Error,
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
          end
        end
    end
    # IF NO DEADLINKS, RUN NULLSET FOR UPDATED TIME
    if Admin::BrokenLink.count == 0
      Admin::BrokenLink.create()
    end
  end
end
