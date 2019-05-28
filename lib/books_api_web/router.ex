defmodule BooksApiWeb.Router do
  use BooksApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BooksApiWeb do
    pipe_through :api

    resources "/authors", AuthorController, except: [:new, :edit]
    resources "/books", BookController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/methods", MethodController, except: [:new, :edit]
  end
end
