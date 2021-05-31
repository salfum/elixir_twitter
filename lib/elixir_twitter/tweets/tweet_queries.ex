defmodule ElixirTwitter.Tweets.TweetQueries do
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Tweets.Tweet

  import Ecto.Query

  def create(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  def recent() do
    query = from tweet in Tweet,
                 order_by: [
                   desc: tweet.inserted_at
                 ]
    Repo.all(query)
  end

  def find_by_id(id) do
    query = from tweet in Tweet
    Repo.get(query, id)
  end

  def replies(id) do
    replies = from tweet in Tweet,
                         where: tweet.parent_id == ^id,
                         order_by: [
                           desc: tweet.inserted_at
                         ]
    Repo.all(replies)
  end
end