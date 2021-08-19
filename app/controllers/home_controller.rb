require 'rss'
require 'open-uri'

class HomeController < ApplicationController
  def index
    url = 'https://anchor.fm/s/fa5d110/podcast/rss'

    URI.open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      @podcast = feed.channel
      @items = feed.items
      
    end
  end

  private
    def homeParams 
      params.require(:home).permit(:url)
    end
end
