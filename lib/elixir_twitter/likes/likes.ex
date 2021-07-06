defmodule ElixirTwitter.Likes do
  alias ElixirTwitter.Likes.LikeQueries

  defdelegate add_like(attrs), to: LikeQueries, as: :create
  defdelegate get(id), to: LikeQueries
  defdelegate get_likes(user_id), to: LikeQueries, as: :get_by_user_id
end
