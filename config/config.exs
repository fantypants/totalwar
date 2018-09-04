# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :totalwar,
  ecto_repos: [Totalwar.Repo]

# Configures the endpoint
config :totalwar, TotalwarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "goRCBDLQIVVFaF6bhcADk89IEZaXMkXQvFGD9BKN6u5VRMrR8gu1CF5L1Yz9bJ8y",
  render_errors: [view: TotalwarWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Totalwar.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
