# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :todo_elixir,
  ecto_repos: [TodoElixir.Repo]

# Configures the endpoint
config :todo_elixir, TodoElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YGRCNNE4UQbL9/9RX18bljj2wRyntnzpKPoUPLXUpmUkb9t7+iYc/J6eiDnz1Wbc",
  render_errors: [view: TodoElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TodoElixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  slime: PhoenixSlime.Engine
