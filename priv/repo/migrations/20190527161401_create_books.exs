defmodule BooksApi.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :description, :text
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:books, [:name])
    create index(:books, [:author_id])
  end
end
