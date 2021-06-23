defmodule ElixirTwitter.Tweets.Tweet do
  use Ecto.Schema

  import Ecto.Changeset

  alias ElixirTwitter.Accounts.User
  alias ElixirTwitter.Likes.Like

  @required [:text, :user_id]
  @optional [:parent_id]

  schema "tweets" do
    field :text, :string
    field :parent_id, :string

    belongs_to :user, User
    has_many :likes, Like

    timestamps()
  end

  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end