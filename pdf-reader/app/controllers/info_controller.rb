class InfoController < ApplicationController
  def download
    send_data('Hello, pretty world :(', :type => 'text/plain', :disposition => 'attachment', :filename => 'test_download.txt')
  end
end
