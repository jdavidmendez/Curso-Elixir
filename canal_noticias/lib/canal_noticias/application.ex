defmodule CanalNoticias.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CanalNoticiasWeb.Telemetry,
      # Start the Ecto repository
      CanalNoticias.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CanalNoticias.PubSub},
      # Start the Endpoint (http/https)
      CanalNoticiasWeb.Endpoint
      # Start a worker by calling: CanalNoticias.Worker.start_link(arg)
      # {CanalNoticias.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CanalNoticias.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CanalNoticiasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
