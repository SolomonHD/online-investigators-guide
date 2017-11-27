class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    Admin::BrokenLink.delete_all

    require 'mechanize'

    # Mechanize
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = agent.get('https://oig-dev.emory.edu/sitemap')

    page.links

    page.links_with(href: %r{.*/pages/\w+}).each do |link|
      internalPage = agent.get(link.href)
        internalPage.links.each do |l|
          begin
           l.click.code.to_s
          rescue Mechanize::ResponseCodeError => e
            case e.response_code
              when "404"
                puts "caught Net :: HTTPNotFound!"
                 Admin::BrokenLink.create(page_id: link.uri.to_s.split('/')[-1], link_text: l.text, page_title: link.text, broken_url: l.uri, link_status: e.response_code)
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


    # page = agent.get('https://oig-dev.emory.edu/sitemap')
    # page.links.internal.each do |l|
    #   puts l.split('/')[-1]
    #   begin
    #     page = agent.get(l)
    #     puts l
    #     page.links.each do |crawl|
    #       puts crawl.text
    #       puts crawl.href
    #       # puts crawl.click.code.to_s
    #     end
    #       # puts page.links
    #       # puts page.title
    #   rescue Mechanize::ResponseCodeError => e
    #       case e.response_code
    #       when "404"
    #         puts page.link.text
    #         puts page.link.uri
    #         puts "caught Net :: HTTPNotFound!"
    #         # Admin::BrokenLink.create(page_id: l.split('/')[-1], link_text: page.link.text, page_title: page.link.text, broken_url: page.link.uri, link_status: e.response_code)
    #         next # If the page can not be found next
    #       when "502"
    #         puts "caught Net :: HTTPBadGateway!"
    #         retry # another time when you can not access it well!
    #       else
    #         puts "caught Excepcion!" + e.response_code
    #         retry
    #       end
    #     puts page
    #   end

      # if !l.include?("#")
      #   #crawl internal link
      #   @internalLink = MetaInspector.new(l, faraday_options: { ssl: { verify: false } })
      #   # puts @internalLink
      #   #get all external links
      #   @internalLink.links.external.each do |el|
      #       @newPage = agent.get(el)
      #       page = begin
      #         puts @newPage
      #       rescue Mechanize::ResponseCodeError => e
      #         puts e.response_code
      #       end
          #skip PDF and PPTX
            # if !el.include?(".pdf") && !el.include?(".pptx")
            #   #crawl external link
            #
            #   @newPage = agent.get(el)
            #   puts @newPage.link.text
            #   @externalLink = MetaInspector.new(el, faraday_options: { ssl: { verify: false } })
            #   # puts @externalLink.text
            #   # if response code is anything other than success
            #   if @externalLink.response.status != 200
            #     # puts @externalLink
            #     # create new broken link in database
            #     # Admin::BrokenLink.create(page_id: @internalLink.url.split('/')[-1], page_title: @internalLink.best_title, url: @externalLink.url, link_status: @externalLink.response.status)
            #   end
            # end
          # end
      # end
      #
      # puts link
      #   puts link.response
        # newPage = agent.get(link)
        # begin
        #   puts newPage
        # rescue Mechanize::ResponseCodeError => e
        #   puts e.response_code
        # end
        # puts newPage
        # begin
        #   # puts link.uri.match(/\pages/)
        #   if link.uri =~ '\pages'
        #     puts link.text
        #     # puts link.uri.include?('pages')
        #   end
        #   # puts link.text
        #   #
        #   # newPage = agent.get(link.uri)
        #   # puts newPage.links
        #   if link.click.code != '200'
        #     # Create Broken Link in Database
        #   end
        # rescue Mechanize::ResponseCodeError => e
        #   # puts e.response_code # the status code as a string, e.g. "404"
        # end

      # end

  end
end
