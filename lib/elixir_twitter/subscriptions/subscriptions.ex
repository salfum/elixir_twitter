defmodule ElixirTwitter.Subscriptions do
  alias ElixirTwitter.Subscriptions.SubscriptionQueries

  defdelegate subscribe(attrs), to: SubscriptionQueries, as: :create
  defdelegate get_subscribers(user_id), to: SubscriptionQueries, as: :get_by_user_id
end
