class Admin::BrokenLink < ApplicationRecord

  def self.runReport
    puts 'Running Report'

    require 'mechanize'

    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = agent.get('https://oig-dev.emory.edu/sitemap')

    page.links.each do |link|
        begin
          puts link.uri.match(/\pages/)
          if link.uri =~ '\pages'
            puts link.text
            # puts link.uri.include?('pages')
          end
          # puts link.text
          #
          # newPage = agent.get(link.uri)
          # puts newPage.links
          if link.click.code != '200'
            # Create Broken Link in Database
          end
        rescue Mechanize::ResponseCodeError => e
          puts e.response_code # the status code as a string, e.g. "404"
        end

      end

  end
end
