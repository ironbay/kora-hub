defmodule Hub.Config do
  use Fig

  config :kora, %{
    writes: [{Kora.Store.Postgres.JSON, [name: :postgres, schema: Kora.Store.Schema.Example]}],
    read: {Kora.Store.Postgres.JSON, [name: :postgres, schema: Kora.Store.Schema.Example]},
    interceptors: [],
    commands: []
    # format: Kora.Format.Sample
  }
end
