defmodule BooksApiWeb.MethodView do
  use BooksApiWeb, :view
  alias BooksApiWeb.MethodView

  def render("index.json", %{methods: methods}) do
    %{data: render_many(methods, MethodView, "method.json")}
  end

  def render("show.json", %{method: method}) do
    %{data: render_one(method, MethodView, "method.json")}
  end

  def render("method.json", %{method: method}) do
    %{id: method.id,
      method: method.method}
  end
end
