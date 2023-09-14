defmodule CanalNoticias.Repo do
  use Ecto.Repo,
    otp_app: :canal_noticias,
    adapter: Ecto.Adapters.Postgres
end
