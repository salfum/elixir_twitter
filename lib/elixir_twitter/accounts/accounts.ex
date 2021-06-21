defmodule ElixirTwitter.Accounts do
  alias ElixirTwitter.Accounts.UserQueries
  alias ElixirTwitter.Guardian
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Accounts.User

  import Comeonin.Argon2, only: [dummy_checkpw: 0]

  def create_user(attrs), do: UserQueries.create(attrs)

  def get_by_email(email) when is_binary(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "Login error."}
      User -> {:ok, User}
    end
  end

  defp verify_password(password, user) when is_binary(password) do
    if Argon2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    case get_by_email(email) do
      :ok -> User
      :error -> dummy_checkpw()
    end
  end

  def token_sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user)
      _ ->
        {:error, :unauthorized}
    end
  end

  def get_user!(id) do
    User
    |> Repo.get!(id)
  end
end