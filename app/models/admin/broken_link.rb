class Admin::BrokenLink < ApplicationRecord

  def self.runReport
    puts 'Running Report'

    require 'mechanize'

    agent = Mechanize.new
    agent.user_agent_alias = 'Windows Chrome'
    page = agent.get('https://oig-dev.emory.edu/sitemap')

    page.links.each do |link|
      puts link.uri
      puts link.response_code
      if link.response_code != '200'
        begin
          puts link.response_code
          puts link.text
        rescue Mechanize::ResponseCodeError => e
          puts e.response_code # the status code as a string, e.g. "404"
          page = e.page
        end

        puts page.title
      end
    end

  end
end
