defmodule ElixirTwitter.Subscriptions.SubscriptionQueries do

  alias ElixirTwitter.Repo
  alias ElixirTwitter.Subscriptions.Subscription

  import Ecto.Query

  def create(attrs \\ %{}) do
    %Subscription{}
    |> Subscription.changeset(attrs)
    |> Repo.insert()
  end

  def get_by_user_id(user_id) do
    query = from s in Subscription,
                 where: s.user_id == ^user_id
    Repo.all(query)
  end
end