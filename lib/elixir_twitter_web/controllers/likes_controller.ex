defmodule ElixirTwitterWeb.LikesController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitter.Tweets
  alias ElixirTwitter.Likes

  @doc """
    Create like for a tweet
  """
  def like_tweet(conn, params) do
    user = Guardian.Plug.current_resource(conn)
    tweet = Tweets.find_by_id(params["tweet_id"])
    like = Likes.add_like(%{"user_id" => user.id, "tweet_id" => tweet.id})
    render(conn, "show.json", %{like: like})
  end

  @doc """
    Return all likes by user_id
  """
  def get_likes(conn, %{"user_id" => user_id}) do
    likes = Likes.get_likes(user_id)
    render(conn, "index.json", %{likes: likes})
  end
end