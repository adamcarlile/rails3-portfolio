class Tumblr
  def self.feed
    feed = Feedzirra::Feed.fetch_and_parse("http://blog.adamcarlile.com/rss").entries
  end
end