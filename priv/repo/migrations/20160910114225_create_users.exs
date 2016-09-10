defmodule Chat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :crypted_password, :string

      timestamps()
    end
    create unique_index(:user, [:email])

  end
end
