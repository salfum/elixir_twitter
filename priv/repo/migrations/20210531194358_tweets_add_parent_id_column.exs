defmodule ElixirTwitter.Repo.Migrations.TweetsAddParentIdColumn do
  use Ecto.Migration

  def change do
    alter table("tweets") do
      add :parent_id, :string
    end
  end
end
