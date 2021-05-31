defmodule ElixirTwitter.Tweets do
  alias ElixirTwitter.Tweets.TweetQueries

  def create_tweet(attrs), do: TweetQueries.create(attrs)
  def recent_tweets(), do: TweetQueries.recent_tweets()
end