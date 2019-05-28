defmodule BooksApi.Accounts.Method do
  use Ecto.Schema
  import Ecto.Changeset

  schema "methods" do
    field :method, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(method, attrs) do
    method
    |> cast(attrs, [:method, :user_id])
    |> validate_required([:method, :user_id])
  end
end
