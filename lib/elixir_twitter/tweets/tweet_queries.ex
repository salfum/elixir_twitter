defmodule ElixirTwitter.Tweets.TweetQueries do
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Tweets.Tweet
  alias ElixirTwitter.Likes.Like
  alias ElixirTwitter.Subscriptions.Subscription

  import Ecto.Query

  def create(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  def recent() do
    query =
      from tweet in Tweet,
        order_by: [
          desc: tweet.inserted_at
        ]

    Repo.all(query)
  end

  def find_by_id(id) do
    query = from(tweet in Tweet)
    Repo.get(query, id)
  end

  def replies(id) do
    replies =
      from tweet in Tweet,
        where: tweet.parent_id == ^id,
        order_by: [
          desc: tweet.inserted_at
        ]

    Repo.all(replies)
  end

  def subscribers_tweets(user_id) do
    query =
      from tweet in Tweet,
        join: subscriber in Subscription,
        on: tweet.user_id == subscriber.sub_user_id,
        where: subscriber.user_id == ^user_id,
        order_by: [
          desc: tweet.inserted_at
        ]

    Repo.all(query)
  end

  def subscribers_liked_tweets(user_id) do
    query =
      from tweet in Tweet,
        join: like in Like,
        on: tweet.id == like.tweet_id,
        join: subscriber in Subscription,
        on: like.user_id == subscriber.sub_user_id,
        where: subscriber.user_id == ^user_id,
        order_by: [
          desc: tweet.inserted_at
        ]

    Repo.all(query)
  end
end
