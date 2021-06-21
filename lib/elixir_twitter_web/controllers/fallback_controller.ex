defmodule ElixirTwitterWeb.FallbackController do
  use ElixirTwitterWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Login error"})
  end
end