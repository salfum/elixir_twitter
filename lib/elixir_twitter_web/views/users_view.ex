defmodule ElixirTwitterWeb.UsersView do
  use ElixirTwitterWeb, :view

  def render("show.json", %{user: user}) do
    %{
      email: user.email,
      username: user.username
    }
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
