# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :books_api,
  ecto_repos: [BooksApi.Repo]

# Configures the endpoint
config :books_api, BooksApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FlQ0BJz+C3Cj6PygDTsmJorafx0yFoSUc/9449QdRstjr2O24ZnJFQQBp8tvss5s",
  render_errors: [view: BooksApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BooksApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
