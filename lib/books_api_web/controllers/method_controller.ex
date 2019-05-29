defmodule BooksApiWeb.MethodController do
  use BooksApiWeb, :controller

  alias BooksApi.Accounts
  alias BooksApi.Accounts.Method

  action_fallback BooksApiWeb.FallbackController

  plug BooksApiWeb.Plugs.CheckMethod when action in [:update, :delete]

  def index(conn, _params) do
    methods = Accounts.list_methods()
    render(conn, "index.json", methods: methods)
  end

  def create(conn, %{"method" => method_params}) do
    with {:ok, %Method{} = method} <- Accounts.create_method(method_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.method_path(conn, :show, method))
      |> render("show.json", method: method)
    end
  end

  def show(conn, %{"id" => id}) do
    method = Accounts.get_method!(id)
    render(conn, "show.json", method: method)
  end

  def update(conn, %{"id" => id, "method" => method_params}) do
    method = Accounts.get_method!(id)

    with {:ok, %Method{} = method} <- Accounts.update_method(method, method_params) do
      render(conn, "show.json", method: method)
    end
  end

  def delete(conn, %{"id" => id}) do
    method = Accounts.get_method!(id)

    with {:ok, %Method{}} <- Accounts.delete_method(method) do
      send_resp(conn, :no_content, "")
    end
  end
end
