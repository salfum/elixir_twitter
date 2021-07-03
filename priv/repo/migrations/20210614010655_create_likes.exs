defmodule ElixirTwitter.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :user_id, :integer, null: false
      add :tweet_id, :integer, null: false

      timestamps()
    end
  end
end
