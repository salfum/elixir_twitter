defmodule ElixirTwitter.Subscriptions do
  alias ElixirTwitter.Subscriptions.SubscriptionQueries

  def subscribe(attrs), do: SubscriptionQueries.create(attrs)
  def get_subscribers(user_id), do: SubscriptionQueries.get_by_user_id(user_id)
end
