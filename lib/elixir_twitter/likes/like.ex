defmodule ElixirTwitter.Likes.Like do
  use Ecto.Schema

  import Ecto.Changeset

  alias ElixirTwitter.Tweets.Tweet
  alias ElixirTwitter.Accounts.User
  alias ElixirTwitter.Likes.Like

  schema "likes" do
    belongs_to :user, User
    belongs_to :tweet, Tweet

    timestamps()
  end

  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:user_id, :tweet_id])
    |> validate_required([:user_id, :tweet_id])
  end
end
