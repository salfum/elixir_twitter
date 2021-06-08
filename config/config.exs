# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_twitter,
  ecto_repos: [ElixirTwitter.Repo]

# Configures the endpoint
config :elixir_twitter, ElixirTwitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nd1S//aryYYnEGLdz3kDe52DX1bpOBfCHssRfKymvmWMqjHijMH2LxXlpmtVGoXD",
  render_errors: [view: ElixirTwitterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirTwitter.PubSub,
  live_view: [signing_salt: "Gy4b5vMa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :elixirTwitter, ElixirTwitter.Guardian,
  issuer: "elixirTwitter",
  secret_key: "ug7CNlo2z2SOSdMIHOIC8mls/t7D5fOTP1wlHcUrspZfCiYhTU3UQdx5cSYIMDwR"
#  serializer: ElixirTwitter.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
