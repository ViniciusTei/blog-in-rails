require 'rss'
require 'open-uri'

class HomeController < ApplicationController
  def index
  end

  def show
    search 
  end

  private
  def search
    begin
      URI.open(params[:rss_query]) do |rss|
        feed = RSS::Parser.parse(rss)
        @podcast = feed.channel
        @items = feed.items
        
      end
    rescue OpenURI::HTTPError => error 
      raise error
      render :index
    end
    
  end

end
