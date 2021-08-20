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
    url = 'https://anchor.fm/s/fa5d110/podcast/rss'
    begin
      URI.open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        @podcast = feed.channel
        @items = feed.items
        render :show
      end
    rescue OpenURI::HTTPError => error 
      raise error
      render :index
    end
    
  end

  private
    def rssParams 
      params.require(:home).permit(:rss_query)
    end
end
