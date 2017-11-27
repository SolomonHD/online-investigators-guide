class Admin::BrokenLink < ApplicationRecord

  def self.runReport

    require 'mechanize'

    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = MetaInspector.new('https://oig-dev.emory.edu/sitemap')
    # page = agent.get('https://oig-dev.emory.edu/sitemap')

    page.links.internal.each do |link|
      puts link
        puts link.response
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

      end

  end
end
