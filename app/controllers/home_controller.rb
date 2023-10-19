class HomeController < ApplicationController
  def index

  end
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Pet Medical Report', # file name
               template: 'layouts/pdf.html.erb',
               layout: 'pdf.html', # optional, use 'pdf.html' for a simple layout
               disposition: 'attachment' # 'attachment' to download, 'inline' to display in the browser
      end
    end
  end
end
