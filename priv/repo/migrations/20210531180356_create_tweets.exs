defmodule ElixirTwitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :text, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
