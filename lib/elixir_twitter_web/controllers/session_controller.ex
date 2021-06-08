defmodule ElixirTwitterWeb.SessionController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitterWeb.Auth.Guardian

  action_fallback ElixirTwitterWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> json(%{msg: "ok"})
    end
  end
end