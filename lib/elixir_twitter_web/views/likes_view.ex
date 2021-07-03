defmodule ElixirTwitterWeb.LikesView do
  use ElixirTwitterWeb, :view

  def render("index.json", %{likes: likes}) do
    render_many(likes, __MODULE__, "show.json", as: :like)
  end

  def render("show.json", %{like: like}) do
    %{
      id: like.id,
      user_id: like.user_id,
      tweet_id: like.tweet_id,
      inserted_at: like.inserted_at
    }
  end
end
