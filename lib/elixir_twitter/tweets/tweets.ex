defmodule ElixirTwitter.Tweets do
  alias ElixirTwitter.Tweets.TweetQueries

  def create_tweet(attrs), do: TweetQueries.create(attrs)
  def find_by_id(id), do: TweetQueries.find_by_id(id)
  def replies(id), do: TweetQueries.replies(id)
  def recent(), do: TweetQueries.recent()
end