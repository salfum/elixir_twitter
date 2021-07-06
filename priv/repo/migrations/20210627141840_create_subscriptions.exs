defmodule ElixirTwitter.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :user_id, references("users")
      add :sub_user_id, references("users")

      timestamps()
    end

    create unique_index(:subscriptions, [:user_id, :sub_user_id])
  end
end
