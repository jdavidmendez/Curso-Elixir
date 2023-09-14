# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :canal_noticias,
  ecto_repos: [CanalNoticias.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :canal_noticias, CanalNoticiasWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: CanalNoticiasWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: CanalNoticias.PubSub,
  live_view: [signing_salt: "TQza9YU5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
