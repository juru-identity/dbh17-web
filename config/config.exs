# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :juru,
  ecto_repos: [Juru.Repo]

# Configures the endpoint
config :juru, Juru.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LazVC34w43JYqXMpQL6R2G8X9sRIZikenl1v7tjlvUUvU9hH2PqrIZddM/ZODVHV",
  render_errors: [view: Juru.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Juru.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
