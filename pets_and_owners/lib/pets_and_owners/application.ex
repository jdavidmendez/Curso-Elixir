defmodule PetsAndOwners.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PetsAndOwnersWeb.Telemetry,
      # Start the Ecto repository
      PetsAndOwners.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PetsAndOwners.PubSub},
      # Start the Endpoint (http/https)
      PetsAndOwnersWeb.Endpoint
      # Start a worker by calling: PetsAndOwners.Worker.start_link(arg)
      # {PetsAndOwners.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetsAndOwners.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetsAndOwnersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
