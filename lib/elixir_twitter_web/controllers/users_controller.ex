defmodule ElixirTwitterWeb.UsersController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitter.Accounts

  def create(conn, params) do
    with {:ok, user} <- Accounts.create_user(params) do
      render(conn, "show.json", %{user: user})
    end
  end
end