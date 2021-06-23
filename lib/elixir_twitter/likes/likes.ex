defmodule ElixirTwitter.Likes do
  alias ElixirTwitter.Likes.LikeQueries

  def add_like(attrs), do: LikeQueries.create(attrs)
  def get(id), do: LikeQueries.get(id)
  def get_likes(user_id), do: LikeQueries.get_by_user_id(user_id)
end
