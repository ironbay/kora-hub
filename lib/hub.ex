NimbleCSV.define(Parser, [])

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
    File.stream!("/home/dax/downloads/data-1548306754441.csv", [], :line)
    |> Hull.Time.Progress.print(1_201_149)
    |> Parser.parse_stream()
    |> Stream.map(fn [path, value] ->
      path = Jason.decode!(path)
      value = Jason.decode!(value)
      {path, value}
    end)
    # |> Stream.filter(fn
    #   {["patient:info" | _], _} -> true
    #   {["ride:info" | _], _} -> true
    #   {["appointment:ride" | _], _} -> true
    #   _ -> false
    # end)
    |> Stream.map(fn {path, value} -> Kora.Mutation.merge(path, value) end)
    |> Stream.chunk(2000)
    |> Stream.map(&Kora.Mutation.combine/1)
    |> Stream.map(fn mut -> Kora.Store.write(mut) end)
    |> Stream.with_index()
    |> Enum.to_list()
  end
end

defmodule Hub.Interceptor do
  use Kora.Interceptor

  def resolve_path(["test"], _, _) do
    %{
      "foo" => "bar"
    }
  end
end
