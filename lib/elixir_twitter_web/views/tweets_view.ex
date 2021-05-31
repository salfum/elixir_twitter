defmodule ElixirTwitterWeb.TweetsView do
  use ElixirTwitterWeb, :view

  def render("index.json", %{tweets: tweets}) do
    render_many(tweets, __MODULE__, "show.json", as: :tweet)
  end

  def render("show.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      parent_id: tweet.parent_id,
      text: tweet.text,
      inserted_at: tweet.inserted_at
    }
  end

  def render("replies.json", %{tweet: tweet, replies: replies}) do
    %{
      tweet: render_one(tweet, __MODULE__, "show.json", as: :tweet),
      replies: render_many(replies, __MODULE__, "show.json", as: :tweet)
    }
  end
end