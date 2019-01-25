defmodule Hub.Config do
  use Fig

  config :kora, %{
    writes: [{Kora.Store.LMDB, [directory: '/home/dax/tmp/lmdb']}],
    read: {Kora.Store.LMDB, [directory: '/home/dax/tmp/lmdb']},
    interceptors: [
      Hub.Interceptor
    ],
    commands: []
    # format: Kora.Format.Sample
  }
end
