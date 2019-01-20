defmodule Hub do
  @moduledoc """
  Documentation for Hub.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hub.hello
      :world

  """
  def import do
    rows =
      "~/tmp/acs"
      |> Path.expand()
      |> File.stream!()
      |> Enum.to_list()

    rows
    |> Stream.map(&Poison.decode!/1)
    |> Task.async_stream(
      fn %{"merge" => merge, "delete" => delete} ->
        %{
          merge: merge,
          delete: delete
        }
        |> Kora.Store.write()
      end,
      ordered: false,
      max_concurrency: 5,
      timeout: 1_000_000
    )
    |> Hull.Time.Progress.print(Enum.count(rows))
    |> Enum.to_list()
  end
end
