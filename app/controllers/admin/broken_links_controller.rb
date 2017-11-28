class Admin::BrokenLinksController < ApplicationController

  def runReport
    Admin::BrokenLink.runReport
    redirect_to admin_path
  end

end
