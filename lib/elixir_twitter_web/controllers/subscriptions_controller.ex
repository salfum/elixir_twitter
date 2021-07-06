defmodule ElixirTwitterWeb.SubscriptionsController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitter.Subscriptions

  @doc """
    Subscribe one user to another
  """
  def subscribe(conn, params) do
    # TODO: case check for errors action_fallback
    with {:ok, subscriber} <- Subscriptions.subscribe(params) do
      render(conn, "show.json", %{subscriber: subscriber})
    end
  end

  @doc """
    Return all subscribers by user_id
  """
  def get_subscribers(conn, %{"user_id" => user_id}) do
    subscribers = Subscriptions.get_subscribers(user_id)
    render(conn, "index.json", %{subscribers: subscribers})
  end
end
