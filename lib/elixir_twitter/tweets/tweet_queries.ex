defmodule ElixirTwitter.Tweets.TweetQueries do
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Tweets.Tweet

  import Ecto.Query

  def create(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  def recent_tweets() do
    query = from tweet in Tweet,
                 order_by: [
                   desc: tweet.inserted_at
                 ]
    Repo.all(query)
  end
end