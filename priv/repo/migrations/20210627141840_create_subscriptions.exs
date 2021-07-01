defmodule ElixirTwitter.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table :subscriptions do
      add :user_id, :integer, null: false
      add :sub_user_id, :integer, null: false

      timestamps()
    end

    subs = ElixirTwitter.Subscriptions.get_subscribers(15)
    followers = subs |> ElixirTwitter.Repo.preload([sub_user: [:tweets]])

    create unique_index(:subscriptions, [:user_id, :sub_user_id])
  end
end
