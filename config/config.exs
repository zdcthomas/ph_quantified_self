# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ph_quantified_self,
  ecto_repos: [PhQuantifiedSelf.Repo]

# Configures the endpoint
config :ph_quantified_self, PhQuantifiedSelfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Dg8tMIkw3dXQrqguStY3+5zcTYxHyEWGUVlTIUx6IUDdEbQ0uSm8jUeooBBz1+JD",
  render_errors: [view: PhQuantifiedSelfWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhQuantifiedSelf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
