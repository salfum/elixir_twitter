defmodule ElixirTwitterWeb.TweetsView do
  use ElixirTwitterWeb, :view

  def render("index.json", %{tweets: tweets}) do
    render_many(tweets, __MODULE__, "show.json", as: :tweet)
  end

  def render("show.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      text: tweet.text,
      inserted_at: tweet.inserted_at
    }
  end
end