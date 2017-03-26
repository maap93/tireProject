# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tire,
  ecto_repos: [Tire.Repo]

config :scrivener_html,
  routes_helper: Tire.Router.Helpers

# Configures the endpoint
config :tire, Tire.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J2qDu7hWQjH/HuCawrpj4D3KKfMArzlWgQdcaL9cpmw2Us+iJY+SjJMLtisnNkSB",
  render_errors: [view: Tire.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tire.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :ex_admin,
  repo: Tire.Repo,
  module: Tire,
  modules: [
    Tire.ExAdmin.Dashboard,
    Tire.ExAdmin.User,
    Tire.ExAdmin.Product,
    Tire.ExAdmin.Request,
    Tire.ExAdmin.Order,
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Tire.User,
  repo: Tire.Repo,
  module: Tire,
  logged_out_url: "/",
  email_from_name: "Admin",
  email_from_email: "webmaster@ctdtires.com",
  opts: [:trackable, :invitable, :rememberable, :authenticatable, :recoverable, :lockable, :unlockable_with_token, :registerable]

config :coherence, Tire.Coherence.Mailer,
  adapter: Swoosh.Adapters.Mailgun,
  api_key: "pubkey-8e4db0f170320b301d2dafdba4b7fbe8",
  domain: "ctdtires.com"
# %% End Coherence Configuration %%

config :xain, :after_callback, {Phoenix.HTML, :raw}
