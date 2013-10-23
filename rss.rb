require 'rss'
require 'open-uri'

class FeedCounter
  def initialize(url)
    @url = url
  end

  def count
    open(@url) do |f|
      rss = RSS::Parser.parse(f.read, false)
      count = rss.items.size
      puts "#{count} in #{@url}"
      count
    end
  end
end

feeds = ["http://rss.cnn.com/rss/cnn_topstories.rss",
         "http://feeds.feedburner.com/railscasts",
         "http://stackoverflow.com/feeds"]

counts = []

feeds.each do |url|
  counts << FeedCounter.new(url).count
end

total = 0
counts.each do |count|
  total += count
end

puts "#{total} total"
