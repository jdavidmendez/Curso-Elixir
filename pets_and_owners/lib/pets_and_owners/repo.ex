defmodule PetsAndOwners.Repo do
  use Ecto.Repo,
    otp_app: :pets_and_owners,
    adapter: Ecto.Adapters.Postgres
end
