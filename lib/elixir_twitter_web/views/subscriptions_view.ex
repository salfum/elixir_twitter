defmodule ElixirTwitterWeb.SubscriptionsView do
  use ElixirTwitterWeb, :view

  def render("index.json", %{subscribers: subscribers}) do
    render_many(subscribers, __MODULE__, "show.json", as: :subscriber)
  end

  def render("show.json", %{subscriber: subscriber}) do
    %{
      id: subscriber.id,
      user_id: subscriber.user_id,
      sub_user_id: subscriber.sub_user_id,
      inserted_at: subscriber.inserted_at
    }
  end
end
