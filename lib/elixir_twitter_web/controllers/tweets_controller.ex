defmodule ElixirTwitterWeb.TweetsController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitter.Tweets
  alias ElixirTwitter.Likes

  @doc """
    Return all tweets sorted by insert date
  """
  def index(conn, _) do
    tweets = Tweets.recent()
    render(conn, "index.json", %{tweets: tweets})
  end

  @doc """
    Return tweet and all replies by id of tweet sorted by insert date
  """
  def show_with_replies(conn, %{"id" => id}) do
    tweet_task = Task.async(fn -> Tweets.find_by_id(id) end)
    replies_task = Task.async(fn -> Tweets.replies(id) end)

    tweet = Task.await(tweet_task)
    replies = Task.await(replies_task)
    render(conn, "replies.json", %{tweet: tweet, replies: replies})
  end

  @doc """
    Create tweet from transferred params
  """
  def create(conn, params) do
    with {:ok, tweet} <- Tweets.create_tweet(params) do
      render(conn, "show.json", %{tweet: tweet})
    end
  end
end