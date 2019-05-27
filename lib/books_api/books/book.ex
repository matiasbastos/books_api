defmodule BooksApi.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :description, :string
    field :name, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :description, :author_id])
    |> validate_required([:name, :description, :author_id])
    |> unique_constraint(:name)
  end
end
