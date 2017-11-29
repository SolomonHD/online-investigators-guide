class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  def search
    require "html_truncator"
    if params[:search]
      @pages = Page.search(params[:search])
    else
      @pages = Page.all
    end
    #code
  end

  def sitemap
    puts 'Run Process'
    @pages = Page.where("body != ''").all
    require 'mechanize'

    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    page = a.get('https://oig-dev.emory.edu/pages/')

    page.links.each do |link|
      begin
        puts link.click
        # puts link.text
      rescue Mechanize::ResponseCodeError => ex
        puts ex.response_code
        puts link.text
      end

    end

  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :header, :body, :parent_id, :is_numbered, label_ids: [] )
    end
end
