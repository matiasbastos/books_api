use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :books_api, BooksApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :books_api, BooksApi.Repo,
  username: "root",
  password: "password",
  database: "books_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
