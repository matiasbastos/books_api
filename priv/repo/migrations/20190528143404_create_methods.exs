defmodule BooksApi.Repo.Migrations.CreateMethods do
  use Ecto.Migration

  def change do
    create table(:methods) do
      add :method, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:methods, [:user_id])
  end
end
