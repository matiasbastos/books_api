defmodule BooksApiWeb.AuthorController do
  use BooksApiWeb, :controller

  alias BooksApi.Books
  alias BooksApi.Books.Author

  action_fallback BooksApiWeb.FallbackController

  plug BooksApiWeb.Plugs.CheckMethod when action in [:create, :update, :delete]

  def index(conn, _params) do
    authors = Books.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- Books.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.author_path(conn, :show, author))
      |> render("show.json", author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Books.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Books.get_author!(id)

    with {:ok, %Author{} = author} <- Books.update_author(author, author_params) do
      render(conn, "show.json", author: author)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Books.get_author!(id)

    with {:ok, %Author{}} <- Books.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
