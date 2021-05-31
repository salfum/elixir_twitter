defmodule ElixirTwitterWeb.UsersView do
  use ElixirTwitterWeb, :view

  def render("show.json", %{user: user}) do
    %{
      email: user.email,
      username: user.username
    }
  end
end