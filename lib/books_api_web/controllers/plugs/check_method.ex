defmodule BooksApiWeb.Plugs.CheckMethod do
  alias BooksApi.Accounts

  def init(_params) do
  end

  def call(conn, _params) do
    %Plug.Conn{private: %{:phoenix_action => action}} = conn
    %BooksApi.Accounts.User{id: current_id} = conn.assigns[:current_user]
    res = Accounts.validate_method(current_id, Atom.to_string(action))
    case res do
      nil -> 
        Plug.Conn.send_resp(conn, 403, "credentials are correct but method not allowed")
        |> Plug.Conn.halt()
      %BooksApi.Accounts.Method{} -> 
        conn
    end
  end
end

