defmodule ElixirTwitter.Tweets do
  alias ElixirTwitter.Tweets.TweetQueries

  defdelegate create(attrs), to: TweetQueries
  defdelegate find_by_id(id), to: TweetQueries
  defdelegate replies(id), to: TweetQueries
  defdelegate recent(), to: TweetQueries
  defdelegate subscribers_tweets(user_id), to: TweetQueries
  defdelegate subscribers_liked_tweets(user_id), to: TweetQueries
end
