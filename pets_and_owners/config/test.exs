import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pets_and_owners, PetsAndOwners.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pets_and_owners_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pets_and_owners, PetsAndOwnersWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Lq+TmZNhgkQJ14FnwBu1PaFTiDxxm0kROU2i5TGufFBqHEERtdH/zP244PYAiFVw",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
