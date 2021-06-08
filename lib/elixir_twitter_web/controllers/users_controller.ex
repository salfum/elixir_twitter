defmodule ElixirTwitterWeb.UsersController do
  use ElixirTwitterWeb, :controller

  alias ElixirTwitter.Accounts

  def create(conn, params) do
    with {:ok, user} <- Accounts.create_user(params) do
      render(conn, "show.json", %{user: user})
    end
  end

  def sign_up(conn, params) do
    with {:ok, user} <- Accounts.create_user(params),
         {:ok, token, _claims} <- ElixirTwitter.Guardian.encode_and_sign(user) do
      conn
      |> render("jwt.json", jwt: token)
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Accounts.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        conn
        |> render("jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end

  def show(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> render("show.json", user: user)
  end
end