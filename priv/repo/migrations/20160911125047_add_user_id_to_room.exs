defmodule Chat.Repo.Migrations.AddUserIdToRoom do
  use Ecto.Migration

  def change do
    alter table(:rooms) do
      add :user_id, references(:users, on_delete: :nothing)
    end
    create index(:rooms, [:user_id])

  end
end
