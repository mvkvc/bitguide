defmodule Bitguide.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BitguideWeb.Telemetry,
      Bitguide.Repo,
      {DNSCluster, query: Application.get_env(:bitguide, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Bitguide.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Bitguide.Finch},
      # Start a worker by calling: Bitguide.Worker.start_link(arg)
      # {Bitguide.Worker, arg},
      # Start to serve requests, typically the last entry
      BitguideWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bitguide.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BitguideWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
