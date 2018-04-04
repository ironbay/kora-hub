defmodule Hub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    Hub.Config.load(Fig.Loader.Env)
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Hub.Worker.start_link(arg)
      # {Hub.Worker, arg},
      {Kora.Server, port: 12000}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hub.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
