defmodule ElixirTwitter.Likes.LikeQueries do
  alias ElixirTwitter.Repo
  alias ElixirTwitter.Likes.Like

  import Ecto.Query

  def create(attrs \\ %{}) do
    %Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end

  def get(id) do
    query = from(like in Like)
    Repo.get(query, id)
  end

  def get_by_user_id(user_id) do
    query =
      from like in Like,
        where: like.user_id == ^user_id,
        order_by: [
          desc: like.inserted_at
        ]

    Repo.all(query)
  end
end
