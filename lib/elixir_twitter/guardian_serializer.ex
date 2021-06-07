defmodule ElixirTwitter.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias ElixirTwitter.Repo
  alias ElixirTwitter.Accounts.User

  def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Неизвестный ресурс"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def from_token(_), do: {:error, "Неизвестный ресурс"}
end