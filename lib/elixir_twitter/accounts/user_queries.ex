defmodule ElixirTwitter.Accounts.UserQueries do
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Accounts.User

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end