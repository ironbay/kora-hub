defmodule Hub.Config do
  use Fig

  config :kora, %{
    writes: [{Kora.Store.Level, directory: "kora.db"}],
    read: {Kora.Store.Level, directory: "kora.db"},
    interceptors: [],
    commands: []
  }
end
