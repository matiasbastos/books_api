defmodule BooksApiWeb.UserController do
  use BooksApiWeb, :controller

  alias BooksApi.Accounts
  alias BooksApi.Accounts.User

  action_fallback BooksApiWeb.FallbackController

  plug BooksApiWeb.Plugs.CheckMethod when action in [:create, :update, :delete]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    %BooksApi.Accounts.User{id: current_id} = conn.assigns[:current_user]
    case current_id == String.to_integer(id) do
      false ->
        Plug.Conn.send_resp(conn, 401, "access denied")
        |> Plug.Conn.halt()
      true ->
        user = Accounts.get_user!(id)
        with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
          render(conn, "show.json", user: user)
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    %BooksApi.Accounts.User{id: current_id} = conn.assigns[:current_user]
    case current_id == String.to_integer(id) do
      false ->
        Plug.Conn.send_resp(conn, 401, "access denied")
        |> Plug.Conn.halt()
      true ->
        user = Accounts.get_user!(id)

        with {:ok, %User{}} <- Accounts.delete_user(user) do
          send_resp(conn, :no_content, "")
        end
    end
  end

  def find_by_username_and_password(conn, user, pass) do
    res = Accounts.validate_user(user, pass)
    case res do
      nil -> Plug.Conn.halt(conn)
      %BooksApi.Accounts.User{} -> 
        Plug.Conn.assign(conn, :current_user, res)
    end
  end
end
