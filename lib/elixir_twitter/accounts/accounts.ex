defmodule ElixirTwitter.Accounts do
  alias ElixirTwitter.Accounts.UserQueries

  def create_user(attrs), do: UserQueries.create(attrs)
end