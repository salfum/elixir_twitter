defmodule ElixirTwitter.Subscriptions.Subscription do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias ElixirTwitter.Accounts.User
  alias ElixirTwitter.Subscriptions.Subscription

  schema "subscriptions" do
    belongs_to :user, User
    belongs_to :sub_user, User

    timestamps()
  end

  def changeset(%Subscription{} = subscription, attrs) do
    subscription
    |> cast(attrs, [:user_id, :sub_user_id])
    |> unique_constraint([:user_id, :sub_user_id])
    |> validate_required([:user_id, :sub_user_id])
  end
end