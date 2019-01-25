defmodule Hub.MixProject do
  use Mix.Project

  def project do
    [
      app: :hub,
      version: "0.1.0",
      elixir: ">= 1.6.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hub.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:kora, path: "../kora"},
      {:fig, github: "ironbay/fig"},
      {:exleveldb, "~> 0.11.0"},
      {:distillery, "~> 1.4", runtime: false},
      {:epgsql, "~> 4.1", override: true},
      {:nimble_csv, "~> 0.3"},
      {:mariaex, "~> 0.8.2"},
      {:db_connection, "~> 1.1", override: true}
    ]
  end
end
